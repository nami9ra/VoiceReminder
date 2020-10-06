//
//  RecorderViewController.swift
//  VoiceReminder
//
//  Created by 渡辺奈実 on 2020/09/22.
//

import UIKit
import AVFoundation

class RecorderViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate{
    
    //画面サイズ取得
    var width: CGFloat = 0
    var height: CGFloat = 0
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var baseView: UIView!
    @IBOutlet var label: UILabel!
    @IBOutlet var playButton: UIButton!
    
    var audioRecorder: AVAudioRecorder! //レコーダ
    var audioPlayer: AVAudioPlayer! //再生
    var isRecording = false //録音状態か判別
    var isPlaying = false //再生状態か判断
    var stringDate: String! //String型の日付
    var reconame: String! //録音した音声の保存名前
    
    override func viewDidLoad() {
        width = baseView.frame.size.width
        height = baseView.frame.size.height
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        StartButton()
    }
    
    @IBAction func recordButtonTapped(_ sender: Any){
        if  !isRecording{
            UIView.animate(withDuration: 0.2){
                self.StartButton()
            }
        }else{
            UIView.animate(withDuration: 0.2){
                self.StopButton()
            }
        }
    }
    
    func StartButton(){
        recordButton.frame = CGRect(x: (width-100)/2, y: (height-100)/2, width: 100, height: 100)
        recordButton.layer.cornerRadius = 50
        record()
    }
    
    func StopButton(){
        recordButton.frame = CGRect(x: (width-56)/2, y: (height-56)/2, width: 56, height: 56)
        recordButton.layer.cornerRadius = 3.0
        record()
    }
    
    func record(){
        if  !isRecording{
            let session = AVAudioSession.sharedInstance()
            try! session.setCategory(AVAudioSession.Category.playAndRecord)
            try! session.setActive(true)
            
            let settings = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 44100,
                AVNumberOfChannelsKey: 2,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            
            audioRecorder = try! AVAudioRecorder(url: getURL(), settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
            
            isRecording = true
            label.text = "録音中"
            playButton.isEnabled = false
        }else{
            audioRecorder.stop()
            isRecording = false
            label.text = "待機中"
            playButton.isEnabled = true
            self.performSegue(withIdentifier: "toDetails", sender: nil)
        }
    }
    
    func getDate(){
        let date: Date = Date() //現在の日付を取得
        //日付のフォーマットを指定する
        let format = DateFormatter()
        format.dateFormat = "yyyyMMddHHmmss"
        //日付をString型に変換する
        stringDate = format.string(from: date)
        reconame = stringDate + ".m4a"
    }
    
    func getURL() -> URL{
        getDate()
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docsDirect = paths[0]
        let url = docsDirect.appendingPathComponent(reconame)//文字列を日付などにして変える
        return url
    }
    
    @IBAction func play(){
        if !isPlaying{
            audioPlayer = try! AVAudioPlayer(contentsOf: getURL())
            audioPlayer.delegate = self
            audioPlayer.play()
            
            isPlaying = true
            label.text = "再生"
            recordButton.isEnabled = false
        }else{
            audioPlayer.stop()
            isPlaying = false
            label.text = "待機中"
            recordButton.isEnabled = true
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

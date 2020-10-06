//
//  ViewController.swift
//  VoiceReminder
//
//  Created by 渡辺奈実 on 2020/09/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate{
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var memoLabel: UILabel!
    @IBOutlet var playButton: UIButton!
    var audioPlayer: AVAudioPlayer! //再生
   
    var saveData: UserDefaults = UserDefaults.standard
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dateLabel.text = saveData.object(forKey: "date") as? String
        timeLabel.text = saveData.object(forKey: "time") as? String
        memoLabel.text = saveData.object(forKey: "memo") as? String
    }
    
    @IBAction func addButton(){
        
    }
    
    @IBAction func play2(){
        audioPlayer = try! AVAudioPlayer(contentsOf: voiceFile)
        audioPlayer.delegate = self
        audioPlayer.play()
    }
}


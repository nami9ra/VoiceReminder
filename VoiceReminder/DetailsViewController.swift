//
//  DetailsViewController.swift
//  VoiceReminder
//
//  Created by 渡辺奈実 on 2020/09/22.
//

import UIKit

class DetailsViewController: UIViewController{
    
    @IBOutlet weak var datePicker: UIDatePicker! //日付選択
    @IBOutlet weak var timePicker: UIDatePicker! //時間選択
    @IBOutlet var memoTextField: UITextField! //タイトル入力

    
    var saveData: UserDefaults = UserDefaults.standard
    var stringDatetime: String!
    var stringDatePicker: String!
    var stringTimePicker: String!
    
    //最初からあるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getDatetime(){
        let date: Date = Date() //現在の日付を取得
        //日付のフォーマットを指定する
        let format = DateFormatter()
        format.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        //日付をString型に変換する
        stringDatetime = format.string(from: date)
    }
    
    //DatePickerの値をString型に変更
    func changeStringDate(){
        let formatDate = DateFormatter()
        let formatTime = DateFormatter()
        formatDate.dateFormat = "yyyy年MM年dd日"
        formatTime.dateFormat = "HH:mm"
        stringDatePicker = formatDate.string(from: datePicker.date)
        stringTimePicker = formatTime.string(from: timePicker.date)
    }
    
    @IBAction func save(){
        //メモが空白なら現在の日時をメモにする
        if memoTextField.text == ""{
            getDatetime()
            memoTextField.text = stringDatetime
        }
        changeStringDate()
        saveData.set(datePicker.date, forKey: "dateDate")
        saveData.set(stringDatePicker, forKey: "date")
        saveData.set(stringTimePicker, forKey: "time")
        saveData.set(memoTextField.text, forKey: "memo")
        self.performSegue(withIdentifier: "toView", sender: nil)
    }
}

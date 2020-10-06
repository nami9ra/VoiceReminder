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
    var request: UNNotificationRequest!
    let calendar: Calendar = Calendar(identifier: .gregorian)
    
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
        tsuchi()
        let center = UNUserNotificationCenter.current()
        center.add(request)
        //self.performSegue(withIdentifier: "toView", sender: nil)
    }
    
    func tsuchi(){
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: datePicker.date)
        let timeComponents = calendar.dateComponents([.hour, .minute], from: timePicker.date)
        
        let year = dateComponents.year!
        let month = dateComponents.month!
        let day = dateComponents.day!
        let hour = timeComponents.hour!
        let minute = timeComponents.minute!
        
        //通知日時を直接指定
        let triggerDate = DateComponents(year: year, month: month, day: day, hour: hour, minute: minute, second: 0)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        //通知コンテンツの作成
        let content = UNMutableNotificationContent()
        
        content.title = "VoiceReminder"
        content.body = saveData.object(forKey: "memo") as! String
        content.sound = UNNotificationSound.default
        
        //すぐに通知を表示
        request = UNNotificationRequest(
            identifier: "CalendarNotification",
            content: content,
            trigger: trigger)
    }
}

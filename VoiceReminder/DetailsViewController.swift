//
//  DetailsViewController.swift
//  VoiceReminder
//
//  Created by 渡辺奈実 on 2020/09/22.
//

import UIKit

class DetailsViewController: UIViewController{
    
    /*
    @IBOutlet weak var Dateation: UITextField!
    @IBOutlet weak var Timeation: UITextField!

    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()

        createDatePicker()
    }

    func createDatePicker(){

        // DatePickerModeをDate(日付)に設定
        datePicker.datePickerMode = .date
        timePicker.datePickerMode = .time

        // DatePickerを日本語化
        datePicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale

        // textFieldのinputViewにdatepickerを設定
        Dateation.inputView = datePicker
        Timeation.inputView = timePicker

        // UIToolbarを設定
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        // Doneボタンを設定(押下時doneClickedが起動)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action:#selector(doneClicked))

        // Doneボタンを追加
        toolbar.setItems([doneButton], animated: true)

        // FieldにToolbarを追加
        Dateation.inputAccessoryView = toolbar
        Timeation.inputAccessoryView = toolbar
    }

    @objc func doneClicked(){
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()

        // 持ってくるデータのフォーマットを設定
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale    = NSLocale(localeIdentifier: "ja_JP") as Locale?
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .medium
        timeFormatter.locale    = NSLocale(localeIdentifier: "ja_JP") as Locale?
        timeFormatter.dateStyle = DateFormatter.Style.medium

        // textFieldに選択した日付を代入
        Dateation.text = dateFormatter.string(from: datePicker.date)
        Timeation.text = timeFormatter.string(from: timePicker.date)

        // キーボードを閉じる
        self.view.endEditing(true)
    }
 */
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
        //最初からあるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

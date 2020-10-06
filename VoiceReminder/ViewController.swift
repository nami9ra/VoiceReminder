//
//  ViewController.swift
//  VoiceReminder
//
//  Created by 渡辺奈実 on 2020/09/22.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var memoLabel: UILabel!
    @IBOutlet var tsutiButton: UIButton!
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
    
    @IBAction func localpush(_ sender: Any){
        let content = UNMutableNotificationContent()
        content.title = "test"
        content.body = "testBody"
        content.sound = UNNotificationSound.default
        //すぐに通知を表示
        let request = UNNotificationRequest(identifier: "immediately", content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }


}


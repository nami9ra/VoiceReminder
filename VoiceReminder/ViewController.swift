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


}


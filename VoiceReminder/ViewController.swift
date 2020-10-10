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
    @IBOutlet var playButton: UIButton!
   
    var saveData: UserDefaults = UserDefaults.standard
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        saveData.set("", forKey: "date")
        saveData.set("", forKey: "time")
        saveData.set("", forKey: "memo")
        dateLabel.text = ""
        timeLabel.text = ""
        memoLabel.text = ""
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dateLabel.text = saveData.object(forKey: "date") as? String
        timeLabel.text = saveData.object(forKey: "time") as? String
        memoLabel.text = saveData.object(forKey: "memo") as? String
    }
    
    @IBAction func addButton(){
        
    }
    
    @IBAction func back(sender: UIStoryboardSegue){
        
    }
}


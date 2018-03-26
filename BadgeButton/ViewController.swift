//
//  ViewController.swift
//  BadgeButton
//
//  Created by liurenchi on 3/26/18.
//  Copyright © 2018 lrc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myBadgeButton: BadgeButton!
    
   
    @IBAction func HideBadgeWhenZero(_ sender: UISwitch) {
        if sender.isOn {
            self.myBadgeButton.hiddenWhenZero = true
        }else{
            self.myBadgeButton.hiddenWhenZero = false
        }
    }
    @IBAction func changeValue(_ sender: UIButton) {
        if sender.tag == 1{
            self.myBadgeButton.badgeNumber = self.myBadgeButton.badgeNumber + 1
        }else{
            self.myBadgeButton.badgeNumber = self.myBadgeButton.badgeNumber - 1
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  AgeApp
//
//  Created by Kaelen Cook on 9/19/19.
//  Copyright © 2019 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bDayInput: UITextField!
    @IBOutlet weak var bDayLabel: UILabel!
    @IBOutlet weak var bDayButton: UIButton!
    @IBOutlet weak var bDaySwitch: UISwitch!
    @IBOutlet weak var haveHadLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bDayLabel.text = ""
        bDayInput.text = "How Old are You?"
    }

    @IBAction func tellBirthday(_ sender: Any) {
        let currentYear: Int = 2019
        let yare = Int(bDayInput.text!)
        var year: Int = 0
        if yare != nil {
            year = yare!
        }
        if bDaySwitch.isOn {
            year += 0
        }
        else {
            year += 1
        }
        let birthYear: Int = currentYear - year
        if bDayInput.text == "" {
            bDayLabel.text = "You need to enter your birthday"
        }
        else if yare == nil {
            bDayLabel.text = "You need to enter a valid number"
        }
        else {
            bDayLabel.text = "You were born in \(birthYear)"
        }
    }
    
    @IBAction func changeStatement(_ sender: Any) {
        if bDaySwitch.isOn {
            haveHadLabel.text = "You have had a birthday this year"
        }
        else {
            haveHadLabel.text = "You haven't had a birthday this year"
        }
    }
    
}


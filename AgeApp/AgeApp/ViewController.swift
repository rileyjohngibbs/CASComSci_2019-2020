//
//  ViewController.swift
//  AgeApp
//
//  Created by Dani Lubezki on 9/19/19.
//  Copyright © 2019 Dani Lubezki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var hasHadBdaySwitch: UISwitch!

    @IBOutlet weak var Submitbutton: UIButton!
    @IBOutlet weak var birthYearDisplayLabel: UILabel!

    
    
    var currentyear = 2019
    var age:Int?
    var birthYear = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
    }
    
    
    @IBAction func Submitbutton(_ sender: UIButton) {
        
        age = Int(ageTextField.text ?? "0")
    
        if hasHadBdaySwitch.isOn {
            birthYear += 0
        } else{
            birthYear += 1
        }
        birthYear += currentyear
        birthYear -= age!
        
        birthYearDisplayLabel.text = "Your birth year is \(birthYear)"
        
        birthYear = 0
        print(birthYear)
    }
    
    

}

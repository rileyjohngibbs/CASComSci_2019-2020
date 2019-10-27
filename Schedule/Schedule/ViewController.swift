//
//  ViewController.swift
//  Schedule
//
//  Created by Kaelen Cook on 10/23/19.
//  Copyright © 2019 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var schedulePicker: UIPickerView!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var scheduleLabel: UILabel!
    var baseButtonColor = UIColor.systemTeal
    let myAcademics = [
        "A": "CAS French",
        "B": "CAS Computer Science",
        "C": "HSE International Film",
        "D": "Science Fiction",
        "F": "CAS Calculus",
        "Monday": "Drama Conservatory",
        "Tuesday": "Drama Conservatory",
        "Wednesday": "Life Skills",
        "Thursday": "Drama Conservatory",
        "Friday": "Drama Conservatory"
    ]
    let artBlock = "afternoon"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return ACBdays.count
        }
        else if component == 1 {
            return Weekdays.count
        }
        else if component == 2 {
            return scheduleType.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "\(ACBdays[row])"
        }
        else if component == 1 {
            return "\(Weekdays[row])"
        }
        else if component == 2 {
            return "\(scheduleType[row])"
        }
        return ""
    }
    
    var ACBdays = ["A", "C", "B"]
    var Weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    var scheduleType = ["Normal", "Double Block", "Assembly"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Button.backgroundColor = baseButtonColor
        Button.frame = CGRect(x: 160, y: 400, width: 100, height: 100)
        Button.layer.cornerRadius = 0.5 * Button.bounds.size.width
    }
    
    @IBAction func pressingButton(_ sender: UIButton) {
        sender.backgroundColor = UIColor.white
    }
    
    @IBAction func didPressButton(_ sender: UIButton) {
        sender.backgroundColor = baseButtonColor
        getSchedule()
    }
    
    func getSchedule() {
        let dayType = schedulePicker.selectedRow(inComponent: 0)
        let ACBDay = ACBdays[dayType]
        let weekDayType = schedulePicker.selectedRow(inComponent: 1)
        let weekDay = Weekdays[weekDayType]
        let scheduleTypeDay = schedulePicker.selectedRow(inComponent: 2)
        let scheduleDay = scheduleType[scheduleTypeDay]
        
        
        var periodRotation:[String: [String]] = ["":[""]]
        periodRotation = getPeriodRotation(scheduleType: scheduleDay, artBlock: artBlock)
        


        var output: String = ""
        for period in periodRotation[ACBDay]! {
            output += "\(period):   "
            if period == "Morning" || period == "Afternoon" {
                output += "\(myAcademics[weekDay] ?? "Free Period")"
            }
            else {
                output += "\(myAcademics[period] ?? "Free Period")"
            }
            output += "\n"
        }
    
        scheduleLabel.text = output
        
    }
    
    func getPeriodRotation (scheduleType: String, artBlock: String) -> [String:[String]] {
        var outlet: [String:[String]] = ["":[""]]
        if scheduleType == "Normal" {
            if artBlock == "morning" {
                outlet = [
                    "A": ["Morning", "D", "E", "G", "H"],
                    "C": ["Morning", "F", "D", "I", "G"],
                    "B": ["Morning", "E", "F", "H", "I"]
                ]
            }
            else if artBlock == "afternoon" {
                outlet = [
                    "A": ["A", "B", "D", "E", "Afternoon"],
                    "C": ["C", "A", "F", "D", "Afternoon"],
                    "B": ["B", "C", "E", "F", "Afternoon"]
                ]
            }
        }
        
        else if scheduleType == "Double Block" {
            if artBlock == "morning" {
                outlet = [
                    "A": ["Morning", "D", "G"],
                    "C": ["Morning", "F", "I"],
                    "B": ["Morning", "E", "H"]
                ]
            }
            else if artBlock == "afternoon" {
                outlet = [
                    "A": ["A", "D", "Afternoon"],
                    "C": ["C", "F", "Afternoon"],
                    "B": ["B", "E", "Afternoon"]
                ]
            }
        }
        
        else if scheduleType == "Assembly" {
            if artBlock == "morning" {
                outlet = [
                    "A": ["Morning"],
                    "C": ["Morning"],
                    "B": ["Morning"]
                ]
            }
            else if artBlock == "afternoon" {
                outlet = [
                    "A": [""],
                    "C": [""],
                    "B": [""]
                ]
            }
        }
        
        return outlet

    }
    

}


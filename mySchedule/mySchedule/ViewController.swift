//
//  ViewController.swift
//  mySchedule
//
//  Created by Dani Lubezki on 10/23/19.
//  Copyright © 2019 Dani Lubezki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let MySchedule:[String:String] = [
    "A": "CAS Spanish",
    "B": "CAS Computer Science",
    "C": "International Film",
    "D": "English",
    "E": "Calculus",
    "F": "Physics",
    "TUES": "Crossfire",
    "FRI": "Crossfire",
    "THURS": "Life Skills",
    "MON": "Free Period",
    "WED": "Free Period"]
    
    @IBOutlet weak var PickerView: UIPickerView!
    
    @IBAction func getSchedule(_ sender: Any) {
        let dayTypeRow = PickerView.selectedRow(inComponent: 0)
        let ACBDay = dayType[dayTypeRow]
        let weekDayRow = PickerView.selectedRow(inComponent: 1)
        let dayOfWeek = weekDay[weekDayRow]
        
        let periodRotation:[String:[String:[String]]] = [
            "A": [
                "Monday": ["A", "B", "D","E","MON","MON"],
                "Tuesday":["A", "B", "D","E","TUES","TUES"],
                "Wednesday":["A", "B", "D","E","WED","WED"],
                "Thursday":["A", "B", "D","E","THURS","THURS"],
                "Friday":["A", "B", "D","E","FRI","FRI"],
            ],
            "C": [
                "Monday": ["C","A","F","D","MON","MON"],
                "Tuesday":["C","A","F","D","TUES","TUES"],
                "Wednesday":["C","A","F","D","WED","WED"],
                "Thursday":["C","A","F","D","THURS","THURS"],
                "Friday":["C","A","F","D","FRI","FRI"],
            ],
            "B": [
                "Monday": ["B","C","E","F","MON","MON"],
                "Tuesday":["B","C","E","F","TUES","TUES"],
                "Wednesday":["B","C","E","F","WED","WED"],
                "Thursday":["B","C","E","F","THURS","THURS"],
                "Friday":["B","C","E","F","FRI","FRI"],
            ],
            ]
        let mySched = getScheduleForDay(periods: periodRotation[ACBDay]![dayOfWeek]!, MySchedule: MySchedule)
        Label.text = mySched
    }
    
    func getScheduleForDay(periods:[String], MySchedule:[String:String]) -> String{
        var output = ""
        for period in periods{
            output += "\(period) -"
            output += MySchedule[period] ?? "free period"
            output += "\n"
        }
        return output
    }
    @IBOutlet weak var Label: UILabel!
    
    var curDayType:String = ""
    var curWeekDay:String = ""
    var curSchedule:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if component == 0 {
            return dayType.count
        }
        else if component == 1 {
            return weekDay.count
        }
        else{
            return Schedule.count
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if component == 0{
                return dayType[row]
            }
            else if component == 1 {
                return weekDay[row]
            } else {
                return Schedule[row]
            }
        }
       // func pickerView( pickerView: UIPickerView, didSelectARow row: Int, InComponent component)
    }

    let Schedule = ["Regular","Assembly","Double Block"]
    let weekDay = ["Monday","Tuesday","Wednesday","Thursday","Friday"]
    let dayType = ["A", "B", "C"]



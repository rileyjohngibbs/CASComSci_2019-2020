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
    var baseButtonColor = UIColor.systemTeal
    let mySchedule = [
        "A": "CAS French",
        "B": "CAS Computer Science",
        "C": "HSE International Film",
        "D": "Science Fiction",
        "E": "Free",
        "F": "CAS Calculus",
        "Mo": "Drama Conservatory",
        "Tu": "Drama Conservatory",
        "Th": "Drama Conservatory",
        "Fr": "Drama Conservatory",
        "We": "Senior Mysteries"
    ]
    
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
    
    var ACBdays = ["A", "B", "C"]
    var Weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    var scheduleType = ["Normal", "Double Block", "Assembly"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Button.backgroundColor = baseButtonColor
        Button.frame = CGRect(x: 160, y: 500, width: 100, height: 100)
        Button.layer.cornerRadius = 0.5 * Button.bounds.size.width
    }
    
    @IBAction func pressingButton(_ sender: UIButton) {
        sender.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func didPressButton(_ sender: UIButton) {
        sender.backgroundColor = baseButtonColor
    }
    

}


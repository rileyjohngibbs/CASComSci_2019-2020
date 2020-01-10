//
//  ViewController.swift
//  ScheduleSaver
//
//  Created by Riley Gibbs on 1/10/20.
//  Copyright © 2020 Riley Gibbs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var scheduleData: [ScheduleItem] = []
    var passedBackItem: ScheduleItem? = nil
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return scheduleData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Period \(scheduleData[row].period)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let scheduleItem = scheduleData[row]
        periodLabel.text = "Period \(scheduleItem.period)"
        courseNameLabel.text = scheduleItem.course
        roomNameLabel.text = scheduleItem.room
        teacherLabel.text = scheduleItem.teacher
    }

    @IBOutlet weak var periodPicker: UIPickerView!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var teacherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        periodPicker.delegate = self
        periodPicker.dataSource = self
        if let existingData = load() {
            scheduleData = existingData
        } else {
            for i in 0...8 {
                let period = ["A", "B", "C", "D", "E", "F", "G", "H", "I"][i]
                scheduleData.append(ScheduleItem(period: period, course: "Free", room: "n/a", teacher: "n/a"))
            }
        }
    }
    
    func load() -> [ScheduleItem]? {
        if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false), let data = try? Data(contentsOf: url.appendingPathComponent("schedule.json")) {
            let scheduleData = try? JSONDecoder().decode([ScheduleItem].self, from: data)
            return scheduleData
        }
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pickerView(periodPicker, didSelectRow: periodPicker.selectedRow(inComponent: 0), inComponent: 0)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditItemViewController {
            destination.scheduleData = scheduleData
            destination.itemIndex = periodPicker.selectedRow(inComponent: 0)
        }
    }

}


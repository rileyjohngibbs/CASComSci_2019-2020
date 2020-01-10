//
//  EditItemViewController.swift
//  ScheduleSaver
//
//  Created by Riley Gibbs on 1/10/20.
//  Copyright © 2020 Riley Gibbs. All rights reserved.
//

import UIKit

class EditItemViewController: UIViewController {
    
    var selectedItem: ScheduleItem? = nil
    var itemIndex: Int? = nil
    var scheduleData: [ScheduleItem] = []
    
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var courseInput: UITextField!
    @IBOutlet weak var roomInput: UITextField!
    @IBOutlet weak var teacherInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let i = itemIndex {
            selectedItem = scheduleData[i]
            periodLabel.text = "Period \(selectedItem!.period)"
            courseInput.text = selectedItem?.course
            roomInput.text = selectedItem?.room
            teacherInput.text = selectedItem?.teacher
        }
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        if let selectedItem = selectedItem {
            selectedItem.course = courseInput.text ?? "n/a"
            selectedItem.room = roomInput.text ?? "n/a"
            selectedItem.teacher = teacherInput.text ?? "n/a"
        }
        save()
    }
    
    func save() {
        if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false), let data = try? JSONEncoder().encode(scheduleData) {
            do {
                try data.write(to: url.appendingPathComponent("schedule.json"))
            } catch {
                print("Failed to save")
            }
        } else {
            print("Could not prepare save")
        }
    }
    


}

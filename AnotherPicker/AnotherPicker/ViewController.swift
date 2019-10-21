//
//  ViewController.swift
//  AnotherPicker
//
//  Created by Dani Lubezki on 10/21/19.
//  Copyright © 2019 Dani Lubezki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return iceCream.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return iceCream[row]
            
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    let iceCream = ["vanilla", "chocolate", "strawberry", "mint chip", "cotton candy", "cookies & cream", "cookie dough", "sherbert"]
    let price = ["2 dollars", "2 dollars", "2.5 dollars", "3 dollars", "3 dollars", "4 dollars", "4 dollars", "3 dollars"]
    @IBAction func Button(_ sender: Any) {
        let row = pickerView.selectedRow(inComponent: 0)
        label.text = "You ordered " + iceCream[row] + " ice cream. It costs " + price[row]
    }

    @IBOutlet weak var label: UILabel!
    
}


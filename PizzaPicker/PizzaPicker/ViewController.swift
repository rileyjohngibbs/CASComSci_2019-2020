//
//  ViewController.swift
//  PizzaPicker
//
//  Created by Dani Lubezki on 10/16/19.
//  Copyright © 2019 Dani Lubezki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pizzaFlavors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pizzaFlavors[row]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var pickerView: UIPickerView!
    let pizzaFlavors = ["La Woman", "Margarita", "White", "Hawaiian", "Salad", "Pepperoni", "Vegetarian", "Grandmother"]
    @IBOutlet weak var label: UILabel!
    
    @IBAction func orderButton(_ sender: Any) {
        let row = pickerView.selectedRow(inComponent: 0)
        label.text = "you ordered a "+pizzaFlavors[row]
    }
    
}


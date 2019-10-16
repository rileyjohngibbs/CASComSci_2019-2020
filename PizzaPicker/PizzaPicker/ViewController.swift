//
//  ViewController.swift
//  PizzaPicker
//
//  Created by Kaelen Cook on 10/16/19.
//  Copyright © 2019 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pizzaFlaves[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pizzaFlaves.count
    }
    
    
    @IBOutlet weak var PizzaLabel: UILabel!
    @IBOutlet weak var PizzaButton: UIButton!
    @IBOutlet weak var PizzaPicker: UIPickerView!
    
    let pizzaFlaves = ["Delicious", "Revolting", "Intruiging", "Encouraging", "Healing", "Depressing", "Disturbing", "Powering"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func OrderMeSomePizza(_ sender: Any) {
        let row = PizzaPicker.selectedRow(inComponent: 0)
        PizzaLabel.text = "You wanna "+pizzaFlaves[row]+" pizza?"
    }
    
}


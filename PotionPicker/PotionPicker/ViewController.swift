//
//  ViewController.swift
//  PotionPicker
//
//  Created by Kaelen Cook on 10/21/19.
//  Copyright © 2019 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return potionList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(potionList[row].key): \(potionList[row].value) Septims"
    }
    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var Picker: UIPickerView!
    @IBOutlet weak var SeptimCount: UILabel!
    
    let potionList: KeyValuePairs = ["Healing": 15, "Poison": 40, "Invisibility": 70, "Strengthening": 20, "Magic Regen": 35, "Stamina Regen": 25, "Void Potion": 200]
    
    var Septims: Int = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SeptimCount.text = "You have \(Septims) Septims left."
        Label.text = ""
    }
    
    @IBAction func getPotion(_ sender: UIButton) {
        let num = Picker.selectedRow(inComponent: 0)
        print("gvhyfjtersxvghdrtu")
        if potionList[num].value > Septims {
            Label.text = "I'm sorry, but you don't seem to have enough septims to purchase this potion."
        }
        else {
            Label.text = "Thank you for purchasing a \(potionList[num].key) potion. That will be \(potionList[num].value) septims please."
            Septims -= potionList[num].value
            SeptimCount.text = "You have \(Septims) Septims left."
        }
    }
    

}


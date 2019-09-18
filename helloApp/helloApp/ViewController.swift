//
//  ViewController.swift
//  helloApp
//
//  Created by Riley John Gibbs on 9/2/19.
//  Copyright © 2019 Riley John Gibbs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var goodnBadJobSwitch: UISwitch!
    @IBOutlet weak var helloButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloButton.setTitle("Good Job", for: .normal)
        nameTextField.text = "Jesus"
        greetingLabel.text = ""
    }
    var badJobList = ["You screwed it up", "Come on", "You can do better", "Horrible job", "You suck"]
    var goodJobList = ["Good job", "Nicely done", "OORAH", "Mission accomplished"]
    
    @IBAction func sayHello(_ sender: Any) {
        var Job: String
        if goodnBadJobSwitch.isOn {
            Job = goodJobList.randomElement()!
        }
        else {
            Job = badJobList.randomElement()!
        }
        if nameTextField.text != nil && nameTextField.text == "Billy" {
            greetingLabel.text = "Die, Billy"
        }
        else {
            greetingLabel.text = "\(Job), \(nameTextField.text ?? "human")."
        }
    }
    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        let yes = sender.isOn
        if yes {
            helloButton.setTitle("Good Job", for: .normal)
        }
        else {
            helloButton.setTitle("Bad Job", for: .normal)
        }
    }
    
}


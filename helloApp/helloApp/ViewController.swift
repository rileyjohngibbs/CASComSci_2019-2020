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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = "Riley"
        sayHello("")
    }

    @IBAction func sayHello(_ sender: Any) {
        greetingLabel.text = "Hello, \(nameTextField.text ?? "human")!"
    }
    
}


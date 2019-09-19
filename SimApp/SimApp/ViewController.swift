//
//  ViewController.swift
//  SimApp
//
//  Created by Kaelen Cook on 9/19/19.
//  Copyright © 2019 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Label.text = "Welcome"
    }
    var count: Int = 0
    @IBAction func buttonPress(_ sender: UIButton) {
        count += 1
        Label.text = "\(count)"
    }
    
}


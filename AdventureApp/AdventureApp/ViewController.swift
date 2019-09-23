//
//  ViewController.swift
//  AdventureApp
//
//  Created by Kaelen Cook on 9/23/19.
//  Copyright © 2019 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Result: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Result.text = "Do you want to initialize?"
        
    }

    @IBAction func press1(_ sender: Any) {
    }
    
    @IBAction func press2(_ sender: Any) {
    }
    
}


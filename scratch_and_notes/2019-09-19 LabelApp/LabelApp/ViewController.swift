//
//  ViewController.swift
//  LabelApp
//
//  Created by Riley Gibbs on 9/19/19.
//  Copyright © 2019 Riley Gibbs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var theOnlyLabel: UILabel!
    var pressCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        pressCount += 1
        theOnlyLabel.text = "The button was pressed \(pressCount) times"
    }
    
}


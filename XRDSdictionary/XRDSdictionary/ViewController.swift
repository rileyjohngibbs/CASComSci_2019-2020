//
//  ViewController.swift
//  XRDSdictionary
//
//  Created by Dani Lubezki on 11/5/19.
//  Copyright © 2019 Dani Lubezki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wordLabel: UILabel!
    
    @IBOutlet weak var defLabel: UILabel!
    
    
    var vocabDefinition: String = ""
    var vocabWord: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        wordLabel.text = vocabWord
        defLabel.text = vocabDefinition

    }
   

}

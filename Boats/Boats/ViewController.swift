//
//  ViewController.swift
//  Boats
//
//  Created by Dani Lubezki on 11/8/19.
//  Copyright © 2019 Dani Lubezki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wordLabel: UILabel!
    
    @IBOutlet weak var defLabel: UILabel!
    
    
    var boat: Boat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = boat!.name
        var color = boat?.color
        var size = boat?.size
        var dp = boat?.dolphinPower
        
        wordLabel.text = name
        defLabel.text = color! + size! + dp!
    }
    
    
}

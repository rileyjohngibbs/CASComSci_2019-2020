//
//  ViewController.swift
//  iDunno
//
//  Created by Kaelen Cook on 10/31/19.
//  Copyright © 2019 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var dict:[String:[String:Int]] = [
            "Button" : [
                "X" : 100,
                "Y" : 100
            ],
            "Button" : [
                "X" : 100,
                "Y" : 150
            ]
        ]
    func addButton() {
        var Xlist = [""]
        var Ylist = [""]
        for each in dict {
            Xlist.append(dict["\(each)"]["X"])
            Ylist.append(dict["\(each)"][1].value)
        }
        Xlist.max()
    }
    
}


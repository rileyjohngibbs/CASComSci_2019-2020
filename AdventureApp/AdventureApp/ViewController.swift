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
        choice1.setTitle("Yes", for: .normal)
        choice2.setTitle("No", for: .normal)
    }
    
    var responseMessages =
                            [
                            "one" :
                                [1: "Initialized",
                                 2: "Not Initialized"],
                            "two" :
                                [1: "You Died",
                                 2: "You Survived"],
                            "three" :
                                [1: "Ok",
                                 2: "Why"]
    ]
    
    var buttonResponses =
                            [
                            "one" :
                                [1: "Yes",
                                 2: "No"],
                            "two" :
                                [1: "Continue",
                                 2: "Go Outside"],
                            "three" :
                                [1: "Become President",
                                 2: "Alien Invasion"],
                            "four" :
                                [1: "",
                                 2: ""]
    ]
    var dicPart = ["one", "two", "three"]
    var number: Int = 0
    
    func runText(option: Int) {
        Result.text = responseMessages[dicPart[number]]![option]
        number += 1
        choice1.setTitle(buttonResponses[dicPart[number]]![1], for: .normal)
        choice2.setTitle(buttonResponses[dicPart[number]]![2], for: .normal)
    }

    @IBAction func press1(_ sender: Any) {
        runText(option: 1)
    }
    
    @IBAction func press2(_ sender: Any) {
        runText(option: 2)
    }
    
}


//
//  ViewController.swift
//  calculator
//
//  Created by Dani Lubezki on 10/7/19.
//  Copyright © 2019 Dani Lubezki. All rights reserved.
//

import UIKit
enum modes {
    case not_set
    case addition
    case subtraction
    case multiplication
}

class ViewController: UIViewController {
    @IBOutlet weak var Label: UILabel!
    var labelString:String = "0"
    var currentMode:modes = .not_set
    var savedNum:Int = 0
    var lastButtonWasMode:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didpressbutton(_ sender: UIButton) {
        let stringValue: String? = sender.titleLabel?.text
        if(lastButtonWasMode == true){
        }
        
        if lastButtonWasMode {
            lastButtonWasMode = false
            labelString = "0"
        }
        labelString = labelString.appending(stringValue!)
        updateText()
    }
    func updateText(){
        guard let labelInt:Int = Int(labelString)else {return}
        if(currentMode == .not_set) {
            savedNum = labelInt
        }
        Label.text = "\(labelInt)"
    }
    
    @IBAction func didPressEquals(_ sender: Any) {
        guard let labelInt:Int = Int(labelString)else{
            return
        }
        if(currentMode == .addition){
            savedNum += labelInt
        }
        currentMode = .not_set
        labelString = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
    }
    
    @IBAction func didPressPlus(_ sender: Any) {
        changeMode(newMode: .addition)
    }
    
    @IBAction func didPressSubtraction(_ sender: Any) {
        changeMode(newMode: .subtraction)
    }
    
    @IBAction func didPressMulti(_ sender: Any){
        changeMode(newMode: .multiplication)
    }
    
    @IBAction func didPressClear(_ sender: Any) {
        labelString = "0"
        currentMode = .not_set
        savedNum = 0
        lastButtonWasMode = false
        Label.text = "0"
    }
    func changeMode(newMode:modes){
        if(savedNum == 0){
            return
        }
        currentMode = newMode
        lastButtonWasMode = true
    }
}



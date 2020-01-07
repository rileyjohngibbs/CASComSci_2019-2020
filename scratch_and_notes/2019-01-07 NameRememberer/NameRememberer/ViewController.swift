//
//  ViewController.swift
//  NameRememberer
//
//  Created by Riley Gibbs on 1/7/20.
//  Copyright © 2020 Riley Gibbs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var nameEntry: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let name: String? = try? String(contentsOf: getNameFileUrl())
        displayGreeting(name: name)
    }
    
    func getNameFileUrl() -> URL {
        let docsDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        return docsDirectory.appendingPathComponent("username.txt")
    }
    
    func displayGreeting(name: String?) {
        greetingLabel.text = "Hello to you, \(name ?? "Somebody New")!"
    }

    @IBAction func saveNameEntry(_ sender: UIButton) {
        let newName: String = nameEntry.text ?? "New Person"
        do {
            try newName.write(to: getNameFileUrl(), atomically: true, encoding: .utf8)
            displayGreeting(name: newName)
        } catch {
            greetingLabel.text = "Couldn't save name"
        }
    }
    
    @IBAction func forgetName(_ sender: UIButton) {
        do {
            try FileManager.default.removeItem(at: getNameFileUrl())
        } catch {
            greetingLabel.text = "Couldn't delete name file"
        }
        displayGreeting(name: nil)
    }
    
}


//
//  ViewController.swift
//  whaleswhalesyayayay
//
//  Created by Dani Lubezki on 1/21/20.
//  Copyright © 2020 Dani Lubezki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var addTextField: UITextField!
    @IBOutlet weak var allWhaleField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func fileUrl() -> URL {
        let documentURL = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return documentURL.appendingPathComponent("data.json")
    }
    
    @IBAction func addWhale(_ sender: Any) {
        let data: [String:String] = [
            "Name": addTextField.text ?? "N/A",
        ]
        var whalesToSave: [[String:String]] = []
        if var oldWhale: [[String:String]] = getJsonData() as [[String:String]]? {
            oldWhale.append(data)
            whalesToSave = oldWhale
        }
        else {
            whalesToSave = [data]
        }
        
        
        let url = fileUrl()
        if let jsonData = try? JSONSerialization.data(withJSONObject: whalesToSave, options: []) {
            try! jsonData.write(to: url)
            print(data)
            addTextField.text = ""
        } else {
            print("Failed to save")
        }
    }
    
    func getJsonData() -> [[String:String]]? {
        let url = fileUrl()
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [[String: String]]? = json as? [[String: String]]
                return dictionary
            }
        }; return nil
    }
    
    
    @IBAction func clearWhale(_ sender: Any) {
        let url = fileUrl()
        try? FileManager.default.removeItem(at:url)
        allWhaleField.text = ""
    }
    
    @IBAction func loadWhale(_ sender: Any) {
        allWhaleField.text = ("")
        let dictionary = getJsonData()
        if let dictionary = dictionary {
            for names in dictionary {
                let name: String = names["Name"]!
                allWhaleField.text = allWhaleField.text! + ("\(name) whale \n")
        }
            
        
        }
    }
}





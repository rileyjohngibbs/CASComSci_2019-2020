//
//  ViewController.swift
//  anotherSWAPI
//
//  Created by Dani Lubezki on 12/11/19.
//  Copyright © 2019 Dani Lubezki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func Button(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/planets/1/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let name: String? = dictionary["name"] as? String
                    if let name = name {
                        label.text = name
                    }
                }
            }
            
        }
        
    }
    
    @IBAction func Button2(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/planets/2/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let name: String? = dictionary["name"] as? String
                    if let name = name {
                        label.text = name
                    }
                }
            }
            
        }
        
    }
    
    @IBAction func Button3(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/planets/3/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let name: String? = dictionary["name"] as? String
                    if let name = name {
                        label.text = name
                    }
                }
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
}
}


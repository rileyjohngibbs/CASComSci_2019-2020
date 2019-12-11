//
//  ViewController.swift
//  anotherSwapiApp
//
//  Created by Riley John Gibbs on 12/10/19.
//  Copyright © 2019 Riley John Gibbs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressOne(_ sender: UIButton) {
        let url: URL = URL(string: "https://swapi.co/api/people/1/")!
        let responseData: Data = try! Data(contentsOf: url)
        let json: Any = try! JSONSerialization.jsonObject(with: responseData, options: [])
        let dictionary: [String: Any] = json as! [String: Any]
        let name: String = dictionary["name"] as! String
        nameLabel.text = name
    }
    
}

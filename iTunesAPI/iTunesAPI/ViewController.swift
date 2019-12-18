//
//  ViewController.swift
//  iTunesAPI
//
//  Created by Dani Lubezki on 12/18/19.
//  Copyright © 2019 Dani Lubezki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ButtonBlond: UIButton!
    @IBOutlet weak var ButtonAnti: UIButton!
    @IBOutlet weak var ButtonIgor: UIButton!
    @IBOutlet weak var ButtonRiver: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewController2
        let senderButton = sender as? UIButton
        if senderButton == ButtonBlond {
            destination.album = "Blond"
        }
        else if senderButton == ButtonAnti {
            destination.album = "Anti"
        }
        else if senderButton == ButtonIgor {
            destination.album = "Igor"
        }
        else if senderButton == ButtonRiver {
            destination.album = "River"
        }
    }

}


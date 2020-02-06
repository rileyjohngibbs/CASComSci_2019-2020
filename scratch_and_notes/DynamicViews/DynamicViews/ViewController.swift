//
//  ViewController.swift
//  DynamicViews
//
//  Created by Riley John Gibbs on 2/6/20.
//  Copyright © 2020 Riley John Gibbs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sender = sender as? UIButton, let number = Int(sender.titleLabel?.text ?? "x"), let vsvc = segue.destination as? VerticalStackViewController {
            vsvc.labelCount = number
        }
    }

}


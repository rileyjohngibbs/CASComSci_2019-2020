//
//  KingStackViewController.swift
//  DynamicStackView
//
//  Created by Riley Gibbs on 2/6/20.
//  Copyright © 2020 Riley Gibbs. All rights reserved.
//

import UIKit

class KingStackViewController: UIViewController {
    
    var labelCount = 5
    
    @IBOutlet weak var lordStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let labels = (1...labelCount).map({ (x) -> UILabel in
            let newLabel = UILabel()
            newLabel.text = "Hello world \(x)"
            newLabel.textAlignment = .center
            return newLabel
        })
        for label in labels {
            lordStackView.addArrangedSubview(label)
            let constraint = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: labels[0], attribute: .height, multiplier: 1, constant: 0)
            if label != labels[0] {
                lordStackView.addConstraint(constraint)
            }
        }
    }
}

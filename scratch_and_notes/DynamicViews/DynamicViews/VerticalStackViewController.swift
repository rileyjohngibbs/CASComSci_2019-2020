//
//  VerticalStackViewController.swift
//  DynamicViews
//
//  Created by Riley John Gibbs on 2/6/20.
//  Copyright © 2020 Riley John Gibbs. All rights reserved.
//

import UIKit

class VerticalStackViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    var labelCount = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let labels = (1...labelCount).map({(_) in UILabel()})
        for (i, label) in labels.enumerated() {
            label.text = "Label no. \(i + 1)"
            label.textAlignment = .center
            let mult = 1.0 / Double(labelCount - 1)
            label.backgroundColor = UIColor(cgColor: CGColor(srgbRed: CGFloat(mult*Double(i)), green: CGFloat(1 - mult*Double(i)), blue: CGFloat(mult*Double(i)), alpha: 1))
            stackView.addArrangedSubview(label)
            let constraint = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: labels[0], attribute: .height, multiplier: 1, constant: 1)
            if i > 0 {
                stackView.addConstraint(constraint)
            }
        }
    }
}

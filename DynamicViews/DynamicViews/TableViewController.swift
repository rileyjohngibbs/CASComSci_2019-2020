//
//  TableViewController.swift
//  DynamicViews
//
//  Created by Dani Lubezki on 2/6/20.
//  Copyright © 2020 Dani Lubezki. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var StackView: UIStackView!
    
    var labelCount = 5;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labels = (1...labelCount).map({ (x) -> UILabel in
            let newLabel = UILabel()
            newLabel.text = "hi buddy \(x)"
            return newLabel
        })
        for label in labels {
            StackView.addArrangedSubview(label)
            let constraint = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: labels[0], attribute: .height, multiplier: 1, constant: 1)
            if label != labels[0] {
                StackView.addConstraint(constraint)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

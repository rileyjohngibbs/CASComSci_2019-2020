//
//  StackView2C.swift
//  DynamicViews
//
//  Created by Dani Lubezki on 2/7/20.
//  Copyright © 2020 Dani Lubezki. All rights reserved.
//

import UIKit

class StackView2C: UIViewController {
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Button.addTarget(self, action:#selector(addButton), for: .touchUpInside )
        
    }
    @objc func showAlert() {
        let alert = UIAlertController(title: "DANGER DANGER", message: "YOU ARE IN GRAVE DANGER", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "PRESS HERE IF YOU DONT CARE", style: .default, handler: {(_) in return}))
        self.present(alert, animated: true, completion: {})}
    @objc func addButton() {
        let newButton = UIButton()
        newButton.setTitle("DANGER INITIATOR", for: .normal)
        newButton.setTitleColor(UIColor(displayP3Red: 1, green: 0, blue: 60, alpha: 1), for: .normal)
        newButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        stackView.addArrangedSubview(newButton)}
    }



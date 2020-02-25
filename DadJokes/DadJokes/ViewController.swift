//
//  ViewController.swift
//  BadKeyboard
//
//  Created by Riley John Gibbs on 2/24/20.
//  Copyright © 2020 Riley John Gibbs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(adjustBottomConstraint), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func adjustBottomConstraint(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        bottomConstraint.constant = keyboardSize.height
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? JokesViewController else { return }
        if (searchField.text ?? "") != "" {
            destination.relativeUrl = "/search?term=\(searchField.text!)"
        } else {
            destination.relativeUrl = "/"
        }
    }

}


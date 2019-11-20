//
//  ViewController.swift
//  Notesyaya
//
//  Created by Dani Lubezki on 11/14/19.
//  Copyright © 2019 Dani Lubezki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var note:Note?
    @IBOutlet weak var noteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        noteTextView.text = note?.note
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        note?.note = noteTextView.text
    }


}


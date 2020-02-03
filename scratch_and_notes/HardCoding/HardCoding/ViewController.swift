//
//  ViewController.swift
//  HardCoding
//
//  Created by Riley Gibbs on 2/3/20.
//  Copyright © 2020 Riley Gibbs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! DetailsViewController
        let button = sender as! UIButton
        if button.titleLabel!.text! == "Mario" {
            dvc.characterClicked = [
                "name": "Mario",
                "description": "a plumber",
                "alignment": "good",
            ]
        } else if button.titleLabel!.text! == "Bowser" {
            dvc.characterClicked = [
                "name": "Bowser",
                "description": "a koopa",
                "alignment": "very bad",
            ]
        } else if button.titleLabel!.text! == "Peach" {
            dvc.characterClicked = [
                "name": "Peach",
                "description": "a princess",
                "alignment": "good and nice",
            ]
        }
    }

}


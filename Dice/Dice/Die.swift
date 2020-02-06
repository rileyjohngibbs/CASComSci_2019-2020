//
//  Die.swift
//  Dice
//
//  Created by Riley John Gibbs on 4/27/19.
//  Copyright © 2019 Riley John Gibbs. All rights reserved.
//

import Foundation
import UIKit

class Die {
    let sides: Int
    var value: Int
    let totaler: () -> Void
    var button: Optional<UIButton>
    var buttonTitleColor: UIColor
    
    init(_ sides: Int, updateWith totaler: @escaping () -> Void) {
        self.sides = sides
        value = 0
        self.totaler = totaler
        self.button = nil
        if let bc = UIColor(named: "ButtonTitleColor") {
            buttonTitleColor = bc
        } else {
            buttonTitleColor = UIColor(red: 0.0, green: 0.25, blue: 0.75, alpha: 1.0)
        }
    }
    
    deinit {
        self.button?.removeFromSuperview()
    }
    
    func makeButton() -> UIButton {
        let newButton = UIButton(type: .custom)
        newButton.addTarget(self, action: #selector(roll(sender:)), for: .touchUpInside)
        self.button = newButton
        updateButtonTitle(withAnimation: false)
        return newButton
    }
    
    @objc func roll(sender: UIButton) {
        roll()
        totaler()
    }
    
    func roll() {
        value = Int.random(in: 1...sides)
        updateButtonTitle()
    }
    
    func updateButtonTitle(withAnimation: Bool=true) {
        if let button_ = button {
            if withAnimation {
                button_.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: finishButtonTitle)
            } else {
                finishButtonTitle(nil)
            }
        }
    }
    
    func finishButtonTitle(_: Timer?) {
        if let button_ = button {
            UIView.performWithoutAnimation {
                button_.setAttributedTitle(
                    NSAttributedString(
                        string: "d\(sides == 100 ? "%" : String(sides)): \(value)",
                        attributes: [
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
                            NSAttributedString.Key.foregroundColor: buttonTitleColor
                        ]
                    ),
                    for: .normal
                )
                button_.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
            }
        }
    }
}

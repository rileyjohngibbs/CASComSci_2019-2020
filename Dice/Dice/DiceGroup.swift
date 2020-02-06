//
//  DieGroup.swift
//  Dice
//
//  Created by Riley John Gibbs on 5/4/19.
//  Copyright © 2019 Riley John Gibbs. All rights reserved.
//

import Foundation

class DiceGroup {
    var dice: [Die]
    var totalType: Int
    
    init() {
        dice = []
        totalType = 0
    }
    
    var count: Int {
        get { return dice.count }
    }
    
    func calcTotal() -> Int {
        let total: Int
        switch (totalType % 3) {
        case 0:
            total = dice.reduce(0, {r, d in r + d.value})
        case 1:
            if let min = dice.map({die in die.value}).min() {
                total = min
            } else {
                total = 0
            }
        case 2:
            if let max = dice.map({die in die.value}).max() {
                total = max
            } else {
                total = 0
            }
        default:
            total = 0
        }
        let sign = totalType < 3 ? 1 : -1
        return sign * total
    }
}

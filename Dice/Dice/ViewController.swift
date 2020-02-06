//
//  ViewController.swift
//  Dice
//
//  Created by Riley John Gibbs on 4/27/19.
//  Copyright © 2019 Riley John Gibbs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var diceBox: UIScrollView!
    @IBOutlet var totalButton: UIButton!
    @IBOutlet var poolDescriptionButton: UIButton!
    @IBOutlet var totalTypeButton: UIButton!
    var diceGroups: [DiceGroup] = [DiceGroup()]
    var currentGroupIndex: Int = 0
    var dieButtonWidth: Int = 0
    var dieButtonColumns: Int = 3
    let dieButtonPadding = 25
    var buttonTitleColor: UIColor = UIColor(red: 0.0, green: 0.25, blue: 0.75, alpha: 1.0)
    let totalTypeNames: [String] = ["Sum", "Min", "Max", "-Sum", "-Min", "-Max"]

    override func viewDidLoad() {
        super.viewDidLoad()
        if view.frame.width < 350 {
            dieButtonColumns = 2
        }
        diceBox.frame = CGRect(
            x: 0,
            y: diceBox.frame.minY,
            width: view.frame.width,
            height: diceBox.frame.height
        )
        diceBox.contentSize.width = diceBox.frame.width
        dieButtonWidth = Int(
            (Int(diceBox.frame.width) - dieButtonPadding * (dieButtonColumns + 1))
                / dieButtonColumns
        )
        if let bc = UIColor(named: "ButtonTitleColor") {
            buttonTitleColor = bc
        } else {
            buttonTitleColor = UIColor(red: 0.0, green: 0.25, blue: 0.75, alpha: 1.0)
        }
        updateDescription()
    }
    
    @IBAction func addD4(sender: UIButton) {
        addDie(4)
    }
    
    @IBAction func addD6(sender: UIButton) {
        addDie(6)
    }
    
    @IBAction func addD8(sender: UIButton) {
        addDie(8)
    }
    
    @IBAction func addD10(sender: UIButton) {
        addDie(10)
    }
    
    @IBAction func addD12(sender: UIButton) {
        addDie(12)
    }
    
    @IBAction func addD20(sender: UIButton) {
        addDie(20)
    }
    
    @IBAction func addD100(sender: UIButton) {
        addDie(100)
    }
    
    @IBAction func changeTotalType(sender: UIButton) {
        let dg = diceGroups[currentGroupIndex]
        dg.totalType = (dg.totalType + 1) % totalTypeNames.count
        updateTotalTypeButton(currentDiceGroup: dg)
    }
    
    func updateTotal() {
        let totals = diceGroups.map({dg in dg.calcTotal()})
        let outOf = totals.count > 1 ? " / \(totals.reduce(0, +))" : ""
        let newTitle = "Total: \(totals[currentGroupIndex])\(outOf)"
        totalButton.setAttributedTitle(NSAttributedString(
            string: newTitle,
            attributes: [NSAttributedString.Key.foregroundColor: buttonTitleColor]
        ), for: .normal)
    }
    
    func updateTotalTypeButton(currentDiceGroup dg: DiceGroup) {
        totalTypeButton.setTitle("⚙︎ \(totalTypeNames[dg.totalType])", for: .normal)
    }
    
    @IBAction func rollCurrent() {
        diceGroups[currentGroupIndex].dice.forEach({die in die.roll()})
        updateTotal()
    }
    
    @IBAction func rollAll() {
        diceGroups.forEach({dg in dg.dice.forEach({die in die.roll()})})
        updateTotal()
    }

    func addDie(_ sides: Int) {
        let die = Die(sides, updateWith: updateTotal)
        diceGroups[currentGroupIndex].dice.append(die)
        let dieButton = die.makeButton()
        let action = #selector(die.roll(sender:))
        addDieButton(dieButton, target: die, action: action)
        updateTotal()
        updateDescription()
        updateDieBoxContentSize()
    }
    
    func addDieButton(_ dieButton: UIButton, target die: Die, action: Selector, index: Int?=nil) {
        let slot: Int = index ?? diceGroups[currentGroupIndex].count - 1
        diceBox.addSubview(dieButton)
        dieButton.addTarget(die, action: action, for: .touchUpInside)
        let x = dieButtonPadding + (dieButtonWidth + dieButtonPadding) * (slot % dieButtonColumns)
        let y = 25 + 75 * (diceRows(index: index) - 1)
        dieButton.frame = CGRect(
            x: x,
            y: y,
            width: dieButtonWidth,
            height: 50
        )
        dieButton.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
    }
    
    func updateDescription() {
        var typeCounts = [Int: Int]()
        diceGroups[currentGroupIndex].dice.forEach({die in
            typeCounts[die.sides] = (typeCounts[die.sides] ?? 0) + 1
        })
        let sortedTypes = [Int](typeCounts.keys).sorted()
        let description = sortedTypes.reduce(
            "—",
            {res, typ in
                "\(res == "—" ? "" : res + " + ")\(typeCounts[typ] ?? 0)d\(typ)"
            }
        )
        poolDescriptionButton.setAttributedTitle(
            NSAttributedString(string: description, attributes: [
                NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 1.0)
            ]),
            for: .normal
        )
    }
    
    func diceRows(index: Int?=nil) -> Int {
        let currentCount = index != nil ? index! + 1 : diceGroups[currentGroupIndex].count
        return Int((currentCount + dieButtonColumns - 1) / dieButtonColumns)
    }

    func updateDieBoxContentSize() {
        diceBox.contentSize = CGSize(
            width: diceBox.contentSize.width,
            height: CGFloat(dieButtonPadding + (50 + dieButtonPadding) * diceRows())
        )
    }
    
    @IBAction func clearDice(sender: UIButton) {
        diceGroups[currentGroupIndex].dice.removeAll()
        updateTotal()
        updateDescription()
        updateDieBoxContentSize()
    }
    
    @IBAction func nextGroup() {
        diceGroups[currentGroupIndex].dice.forEach({die in
            die.button?.removeFromSuperview()
        })
        if diceGroups[currentGroupIndex].count == 0 {
            diceGroups.remove(at: currentGroupIndex)
        } else {
            currentGroupIndex += 1
        }
        if currentGroupIndex == diceGroups.count {
            diceGroups.append(DiceGroup())
        }
        renderDiceButtons()
    }
    
    @IBAction func previousGroup() {
        diceGroups[currentGroupIndex].dice.forEach({die in
            die.button?.removeFromSuperview()
        })
        if currentGroupIndex != 0 {
            if diceGroups[currentGroupIndex].dice.count == 0 {
                diceGroups.remove(at: currentGroupIndex)
            }
            currentGroupIndex -= 1
        }
        renderDiceButtons()
    }
    
    func renderDiceButtons() {
        diceGroups[currentGroupIndex].dice.enumerated().forEach({i, die in
            let dieButton = die.makeButton()
            let action = #selector(die.roll(sender:))
            addDieButton(dieButton, target: die, action: action, index: i)
        })
        updateDescription()
        updateTotal()
        updateDieBoxContentSize()
        updateTotalTypeButton(currentDiceGroup: diceGroups[currentGroupIndex])
    }
}

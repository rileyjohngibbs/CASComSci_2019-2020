//
//  GameManager.swift
//  Snake
//
//  Created by Riley John Gibbs on 4/15/20.
//  Copyright © 2020 Riley John Gibbs. All rights reserved.
//

import SpriteKit

class GameManager {
    
    enum Direction {
        case left
        case up
        case right
        case down
        case stop
    }
    
    var scene: GameScene!
    var nextTime: Double?  // Optional, not bang!
    var timeExtension: Double = 0.15
    var playerDirection: Direction = Direction.left
    var currentScore: Int = 0
    
    init(scene: GameScene) {
        self.scene = scene
    }
    
    func initGame() {
        scene.playerPositions.append((10, 10))
        scene.playerPositions.append((10, 11))
        scene.playerPositions.append((10, 12))
        renderChange()
        generateNewPoint()
    }
    
    private func generateNewPoint() {
        var randomX = CGFloat(arc4random_uniform(19))
        var randomY = CGFloat(arc4random_uniform(39))
        while contains(a: scene.playerPositions, v: (Int(randomX), Int(randomY))) {  // TODO: Is this a bug? Should the order be flipped? I think sometimes the apple is showing up underneath the snake's tail.
            randomX = CGFloat(arc4random_uniform(19))
            randomY = CGFloat(arc4random_uniform(39))
        }
        scene.scorePos = CGPoint(x: randomX, y: randomY)  // TODO: Don't use CGPoint with CGFloat values; use (x: Int, y: Int)
    }
    
    func update(time: Double) {  // In GameScene, we call this with a TimeInterval
        if nextTime == nil {
            nextTime = time + timeExtension
        } else {
            if time >= nextTime! {
                nextTime = time + timeExtension
                updatePlayerPosition()
                checkForScore()
                checkForDeath()
                finishAnimation()
            }
        }
    }
    
    func renderChange() {
        for (node, x, y) in scene.gameArray {
            if contains(a: scene.playerPositions, v: (x, y)) {
                node.fillColor = SKColor.cyan
            } else {
                node.fillColor = SKColor.clear
                if scene.scorePos != nil {
                    if Int((scene.scorePos?.x)!) == y && Int((scene.scorePos?.y)!) == x { // TODO: This is dumb that we're comparing x to y
                        node.fillColor = SKColor.red
                    }
                }
            }
        }
    }
    
    func contains(a: [(Int, Int)], v: (Int, Int)) -> Bool {  // TODO: Use native Array.contains method
        let (c1, c2) = v
        for (v1, v2) in a {
            if v1 == c1 && v2 == c2 {
                return true
            }
        }
        return false
    }
    
    func updatePlayerPosition() {
        var xChange = -1
        var yChange = 0
        switch playerDirection {
        case .left:
            xChange = -1
            yChange = 0
            break
        case .up:
            xChange = 0
            yChange = -1
            break
        case .right:
            xChange = 1
            yChange = 0
            break
        case .down:
            xChange = 0
            yChange = 1
            break
        case .stop:
            xChange = 0
            yChange = 0
        }
        if scene.playerPositions.count > 0 {
            var start = scene.playerPositions.count - 1  // Move from tail toward head
            while start > 0 {
                scene.playerPositions[start] = scene.playerPositions[start - 1]
                start -= 1
            }
            scene.playerPositions[0] = (scene.playerPositions[0].0 + yChange, scene.playerPositions[0].1 + xChange)
        }
        if scene.playerPositions.count > 0 {
            let x = scene.playerPositions[0].1
            let y = scene.playerPositions[0].0
            if y > 39 {
                scene.playerPositions[0].0 = 0
            } else if y < 0 {
                scene.playerPositions[0].0 = 39
            } else if x > 19 {
                scene.playerPositions[0].1 = 0
            } else if x < 0 {
                scene.playerPositions[0].1 = 19
            }
        }
        renderChange()
    }
    
    private func checkForScore() {
        if scene.scorePos != nil {  // TODO: Change to an if let statement
            let x = scene.playerPositions[0].0
            let y = scene.playerPositions[0].1
            if Int((scene.scorePos?.x)!) == y && Int((scene.scorePos?.y)!) == x {
                currentScore += 1
                scene.currentScore.text = "Score: \(currentScore)"
                generateNewPoint()
                scene.playerPositions.append(scene.playerPositions.last!)
                scene.playerPositions.append(scene.playerPositions.last!)
                scene.playerPositions.append(scene.playerPositions.last!)
            }
        }
    }
    
    func checkForDeath() {
        if scene.playerPositions.count > 0 {
            var arrayOfPositions = scene.playerPositions
            let headOfSnake = arrayOfPositions[0]
            arrayOfPositions.remove(at: 0)
            if contains(a: arrayOfPositions, v: headOfSnake) {
                playerDirection = .stop
            }
        }
    }
    
    private func finishAnimation() {
        if playerDirection == .stop && scene.playerPositions.count > 0 {
            var hasFinished = true  // TODO: Define once with !contains
            let headOfSnake = scene.playerPositions[0]
            for position in scene.playerPositions {
                if headOfSnake != position {
                    hasFinished = false  // TODO: Add break statement
                }
            }
            if hasFinished {
                updateScore()
                playerDirection = .down
                scene.scorePos = nil
                scene.playerPositions.removeAll()
                renderChange()
                scene.currentScore.run(SKAction.scale(to: 0, duration: 0.4)) {
                    self.scene.currentScore.isHidden = true
                }
                scene.gameBG.run(SKAction.scale(to: 0, duration: 0.4)) {
                    self.scene.gameBG.isHidden = true
                    self.scene.gameLogo.isHidden = false
                    self.scene.gameLogo.run(SKAction.move(to: CGPoint(x: 0, y: (self.scene.frame.size.height / 2) - 200), duration: 0.5)) {  // TODO: Abstract the position of gameLogo and playButton
                        self.scene.playButton.isHidden = false
                        self.scene.playButton.run(SKAction.scale(to: 1, duration: 0.3))
                        self.scene.bestScore.run(SKAction.move(to: CGPoint(x: 0, y: self.scene.gameLogo.position.y - 50), duration: 0.3))
                    }
                }
            }
        }
    }
    
    func swipe(ID: Direction) {
        if opposite(ID) != playerDirection && playerDirection != .stop {
            playerDirection = ID
        }
    }
    
    private func opposite(_ direction: Direction) -> Direction? {
        switch direction {
        case .left:
            return .right
        case .right:
            return .left
        case .up:
            return .down
        case .down:
            return .up
        case .stop:
            return nil
        }
    }
    
    private func updateScore() {
        if currentScore > UserDefaults.standard.integer(forKey: "bestScore") {
            UserDefaults.standard.set(currentScore, forKey: "bestScore")
        }
        currentScore = 0
        scene.currentScore.text = "Score: 0"
        scene.bestScore.text = "Best Score: \(UserDefaults.standard.integer(forKey: "bestScore"))"
    }

}

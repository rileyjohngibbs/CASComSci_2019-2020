//
//  GameScene.swift
//  Snake
//
//  Created by Riley John Gibbs on 4/15/20.
//  Copyright © 2020 Riley John Gibbs. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var gameLogo: SKLabelNode!
    var bestScore: SKLabelNode!
    var playButton: SKShapeNode!
    var game: GameManager!
    var currentScore: SKLabelNode!
    var playerPositions: [Position] = []
    var gameBG: SKShapeNode!
    var gameArray: [Cell] = []
    var scorePos: Position?
    
    override func didMove(to view: SKView) {
        initializeMenu()
        game = GameManager(scene: self)
        initializeGameView()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeR))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeL))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeU))
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeD))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
    }
    
    @objc func swipeR() {
        game.swipe(ID: .right)
    }
    
    @objc func swipeU() {
        game.swipe(ID: .up)
    }
    
    @objc func swipeL() {
        game.swipe(ID: .left)
    }
    
    @objc func swipeD() {
        game.swipe(ID: .down)
    }
        
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        game.update(time: currentTime)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at: location)
            for node in touchedNode {
                if node.name == "play_button" {
                    startGame()
                }
            }
        }
    }
    
    private func startGame() {
        gameLogo.run(SKAction.move(by: CGVector(dx: -50, dy: 600), duration: 0.5)) {
            self.gameLogo.isHidden = true
        }
        playButton.run(SKAction.scale(by: 0, duration: 0.5)) {
            self.playButton.isHidden = true
        }
        let bottomCorner = CGPoint(x: 0, y: (frame.size.height / -2) + 20)
        bestScore.run(SKAction.move(to: bottomCorner, duration: 0.4)) {
            self.gameBG.setScale(0)
            self.currentScore.setScale(0)
            self.gameBG.isHidden = false
            self.currentScore.isHidden = false
            self.gameBG.run(SKAction.scale(to: 1, duration: 0.4))
            self.currentScore.run(SKAction.scale(to: 1, duration: 0.4))
            self.game.initGame()
        }
    }
    
    private func initializeMenu() {
        gameLogo = SKLabelNode(fontNamed: "ArialRoundedMTBold")  // TODO: Abstract the font name
        gameLogo.zPosition = 1
        gameLogo.position = CGPoint(x: 0, y: (frame.size.height / 2) - 200)
        gameLogo.fontSize = 60
        gameLogo.text = "SNAKE"
        gameLogo.fontColor = SKColor.red
        self.addChild(gameLogo)
        
        bestScore = SKLabelNode(fontNamed: "ArialRoundedMTBold")
        bestScore.zPosition = 1
        bestScore.position = CGPoint(x: 0, y: gameLogo.position.y - 50)
        bestScore.fontSize = 40
        bestScore.text = "Best Score: \(UserDefaults.standard.integer(forKey: "bestScore"))"
        bestScore.fontColor = SKColor.white
        self.addChild(bestScore)
        
        playButton = SKShapeNode()
        playButton.name = "play_button"
        playButton.zPosition = 1
        playButton.position = CGPoint(x: 0, y: (frame.size.height / -2) + 200)
        playButton.fillColor = SKColor.cyan
        
        let topCorner = CGPoint(x: -50, y: 50)
        let bottomCorner = CGPoint(x: -50, y: -50)
        let middle = CGPoint(x: 50, y: 0)
        let path = CGMutablePath()
        path.addLines(between: [topCorner, bottomCorner, middle])
        playButton.path = path
        self.addChild(playButton)
    }
    
    private func initializeGameView() {
        currentScore = SKLabelNode(fontNamed: "ArialRoundedMTBold")
        currentScore.zPosition = 1
        currentScore.position = CGPoint(x: 0, y: (frame.size.height / -2) + 60)
        currentScore.fontSize = 40
        currentScore.isHidden = true
        currentScore.text = "Score: 0"
        currentScore.fontColor = SKColor.white
        self.addChild(currentScore)
        let width = Int(frame.size.width - 200)
        let height = Int(frame.size.height - 300)
        let rect = CGRect(x: -width / 2, y: -height / 2, width: width, height: height)
        gameBG = SKShapeNode(rect: rect, cornerRadius: 0.02)
        gameBG.fillColor = SKColor.darkGray
        gameBG.zPosition = 2
        gameBG.isHidden = true
        self.addChild(gameBG)
        createGameBoard(width: width, height: height)
    }
    
    private func createGameBoard(width: Int, height: Int) {
        let numRows = 40
        let numCols = 20
        let cellWidth: CGFloat = CGFloat(width) / 20
        let cellHeight: CGFloat = CGFloat(height) / 40
        var x = CGFloat(width / -2) + (cellWidth / 2)
        var y = CGFloat(height / 2) - (cellHeight / 2)
        for j in 0...numRows - 1 {
            for i in 0...numCols - 1 {
                let cellNode = SKShapeNode(rectOf: CGSize(width: cellWidth, height: cellHeight))
                cellNode.strokeColor = SKColor.black
                cellNode.zPosition = 2
                cellNode.position = CGPoint(x: x, y: y)
                let cell = Cell(node: cellNode, position: Position(x: i, y: j))
                gameArray.append(cell)
                gameBG.addChild(cellNode)
                x += cellWidth
            }
            x = CGFloat(width / -2) + (cellWidth / 2)
            y -= cellHeight
        }
    }
}

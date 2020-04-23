//
//  Structs.swift
//  Snake
//
//  Created by Riley John Gibbs on 4/22/20.
//  Copyright © 2020 Riley John Gibbs. All rights reserved.
//

import SpriteKit

struct Position: Equatable {
    var x: Int
    var y: Int
}

struct Cell {
    let node: SKShapeNode
    let position: Position
}

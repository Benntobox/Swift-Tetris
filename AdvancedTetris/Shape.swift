//
//  Shape.swift
//  AdvancedTetris
//
//  Created by Benjamin Boyle on 2/10/18.
//  Copyright © 2018 Benjamin Boyle. All rights reserved.
//

import Foundation

class BlockShape {
    var orientation: Orientation
    var position: Position
    var color: Color
    var relativeBlockPositions: [Position]
    var actualBlockPositions: [Position] {
        return actualPositions(of: relativeBlockPositions)
    }
    
    init() {
        orientation = .up
        position = (5, 1)
        color = Color.blue
        relativeBlockPositions = [Position]()
    }
    
    func rotate() {
        rotateShape()
        var newPositions = [Position]()
        for pos in relativeBlockPositions {
            newPositions.append((-pos.column, pos.row))
        }
        relativeBlockPositions = newPositions
    }
    
    func rotateShape() {
        switch orientation {
        case .up:
            orientation = .right
        case .right:
            orientation = .down
        case .down:
            orientation = .left
        case .left:
            orientation = .up
        }
    }

    func actualPosition(of position: Position) -> Position {
        return (position.row + self.position.row, position.column + self.position.column)
    }

    func actualPositions(of positions: [Position]) -> [Position] {
        return positions.map { actualPosition(of: $0) }
    }
    
    static func random() -> BlockShape {
        let randomNumber = arc4random_uniform(7)
        switch Shape(rawValue: randomNumber)! {
        case .square:
            return Square()
        case .line:
            return Line()
        case .lblock:
            return LBlock()
        case .reverselblock:
            return ReverseLBlock()
        case .squiggly:
            return Squiggly()
        case .reversesquiggly:
            return ReverseSquiggly()
        case .tblock:
            return TBlock()
        }
    }
}

class Square: BlockShape {
    override init() {
        super.init()
        color = Color.red
        relativeBlockPositions = [(0, 0), (1, 0), (0, 1), (1, 1)]
    }
}

class Line: BlockShape {
    override init() {
        super.init()
        color = Color.red
        relativeBlockPositions = [(0, 0), (1, 0), (0, 1), (1, 1)]
    }
}

class LBlock: BlockShape {
    override init() {
        super.init()
        color = Color.red
        relativeBlockPositions = [(0, 0), (1, 0), (0, 1), (1, 1)]
    }
}

class ReverseLBlock: BlockShape {
    override init() {
        super.init()
        color = Color.red
        relativeBlockPositions = [(0, 0), (1, 0), (0, 1), (1, 1)]
    }
}

class Squiggly: BlockShape {
    override init() {
        super.init()
        color = Color.red
        relativeBlockPositions = [(0, 0), (1, 0), (0, 1), (1, 1)]
    }
}

class ReverseSquiggly: BlockShape {
    override init() {
        super.init()
        color = Color.red
        relativeBlockPositions = [(0, 0), (1, 0), (0, 1), (1, 1)]
    }
}

class TBlock: BlockShape {
    override init() {
        super.init()
        color = Color.red
        relativeBlockPositions = [(0, 0), (1, 0), (0, 1), (1, 1)]
    }
}

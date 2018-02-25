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
    var relativeBlockPositions = [Position]()
    var actualBlockPositions: [Position] {
        return actualPositions(of: relativeBlockPositions)
    }
    
    init() {
        orientation = .up
        position = (5, 1)
        color = Color.white
    }
    
    func getRotated() -> [Position] {
        return relativeBlockPositions.map { (-$0.column, $0.row) as Position }
    }
    
    func rotate() {
        relativeBlockPositions = relativeBlockPositions.map { (-$0.column, $0.row) as Position }
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
        switch Shape(rawValue: Int(randomNumber))! {
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

//  Square
//     -1   0   1
// -1   o   o   o
//  0   o   x   x
//  1   o   x   x

class Square: BlockShape {
    override init() {
        super.init()
        color = Color.red
        relativeBlockPositions = [(0, 0), (1, 0), (0, 1), (1, 1)]
    }
}

//  Line
//     -1   0   1   2
// -1   o   o   o   o
//  0   x   x   x   x
//  1   o   o   o   o

class Line: BlockShape {
    override init() {
        super.init()
        color = Color.blue
        relativeBlockPositions = [(0, 0), (-1, 0), (1, 0), (2, 0)]
    }
}

//  L-Block
//     -1   0   1
// -1   x   o   o
//  0   x   x   x
//  1   o   o   o

class LBlock: BlockShape {
    override init() {
        super.init()
        color = Color.orange
        relativeBlockPositions = [(0, 0), (1, 0), (-1, 0), (-1, -1)]
    }
}

//  Reverse L-Block
//     -1   0   1
// -1   o   o   o
//  0   x   x   x
//  1   x   o   o

class ReverseLBlock: BlockShape {
    override init() {
        super.init()
        color = Color.green
        relativeBlockPositions = [(0, 0), (1, 0), (-1, 0), (-1, 1)]
    }
}

//  Squiggly
//     -1   0   1
// -1   x   o   o
//  0   x   x   o
//  1   o   x   o

class Squiggly: BlockShape {
    override init() {
        super.init()
        color = Color.yellow
        relativeBlockPositions = [(0, 0), (-1, 0), (-1, -1), (0, 1)]
    }
}

//  Reverse Squiggly
//     -1   0   1
// -1   o   o   x
//  0   o   x   x
//  1   o   x   o

class ReverseSquiggly: BlockShape {
    override init() {
        super.init()
        color = Color.gray
        relativeBlockPositions = [(0, 0), (1, 0), (1, -1), (0, 1)]
    }
}

//  Square
//     -1   0   1
// -1   o   o   o
//  0   x   x   x
//  1   o   x   o

class TBlock: BlockShape {
    override init() {
        super.init()
        color = Color.purple
        relativeBlockPositions = [(0, 0), (1, 0), (-1, 0), (0, 1)]
    }
}

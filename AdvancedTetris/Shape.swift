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
        get {
            var newPositionList = [Position]()
            for position in relativeBlockPositions {
                newPositionList.append((position.row + self.position.row, position.column + self.position.column))
            }
            return newPositionList
        }
    }
    
    init() {
        orientation = .up
        position = (5, 1)
        color = Color.blue
        relativeBlockPositions = [Position]()
    }
    
    func rotate() -> [Position] {
        var newPositions = [Position]()
        for pos in relativeBlockPositions {
            newPositions.append((-pos.column, pos.row))
        }
        return newPositions
    }
    
    func rotated() {
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
}

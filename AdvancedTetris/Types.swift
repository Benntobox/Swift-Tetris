//
//  Types.swift
//  AdvancedTetris
//
//  Created by Benjamin Boyle on 2/10/18.
//  Copyright © 2018 Benjamin Boyle. All rights reserved.
//

import Foundation

// Types of shape possible
enum Shape {
    case square
    case lblock
    case reverselblock
    case squiggly
    case reversesquiggly
    case line
    case tblock
}

// Possible shape orientations
enum Orientation {
    case up
    case right
    case down
    case left
    
    func rotate() -> Orientation {
        switch self {
        case .up:
            return .right
        case .down:
            return .left
        case .right:
            return .down
        case .left:
            return .up
        }
    }
}
// Possible block colors
enum Color {
    case green
    case red
    case yellow
    case orange
    case pink
    case purple
    case blue
}

// Direction for moving shapes left right and down
enum Direction {
    case left
    case right
    case down
}

// Positions for block locations (row, column)
typealias Position = (row: Int, column: Int)

struct Block {
    var color: Color
    
    init(color: Color) {
        self.color = color
    }
}

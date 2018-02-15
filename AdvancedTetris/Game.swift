//
//  Game.swift
//  AdvancedTetris
//
//  Created by Benjamin Boyle on 2/10/18.
//  Copyright © 2018 Benjamin Boyle. All rights reserved.
//

import Foundation

class Tetris {
    var currentShape = BlockShape.random()
    var gameGrid: Grid<Block>
    
    var rowCount: Int
    var columnCount: Int
    var stepCount: Int
    
    init(rowsCount: Int, columnsCount: Int, stepsCount: Int) {
        rowCount = rowsCount
        columnCount = columnsCount
        stepCount = stepsCount
        
        gameGrid = Grid(type: Block(color: Color.white), rows: rowCount, columns: columnCount)
    }
    
    func gameLoop() {
        
    }
    
    func shiftPosition(_ position: Position, to direction: Direction) -> Position {
        switch direction {
        case .down:
            return (position.row, position.column + 1) as Position
        case .left:
            return (position.row - 1, position.column) as Position
        case .right:
            return (position.row + 1, position.column) as Position
        }
    }
    
    func isValidPosition(_ positions: [Position]) -> Bool {
        for position in positions {
            if !(0..<rowCount).contains(position.row) || !(0..<columnCount).contains(position.column) || gameGrid[position.row, position.column] != nil {
                return false
            }
        }
        return true
    }
    
    func isMoveValid(in direction: Direction) -> Bool {
        return isValidPosition(currentShape.actualBlockPositions.map { shiftPosition($0, to: direction) })
    }
    
    func move(in direction: Direction) {
        if isMoveValid(in: direction) {
            currentShape.position = shiftPosition(currentShape.position, to: direction)
        }
    }
    
}

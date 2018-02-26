//
//  Game.swift
//  AdvancedTetris
//
//  Created by Benjamin Boyle on 2/10/18.
//  Copyright © 2018 Benjamin Boyle. All rights reserved.
//

import Foundation

protocol GameDelegate: class {
    func render(grid: Grid<Block?>)
}

class Tetris {
    var currentShape = BlockShape.random()
    var gameGrid: Grid<Block?>
    var timer: Timer = Timer()
    
    var rowCount: Int
    var columnCount: Int
    var stepCount: Double
    
    weak var delegate: GameDelegate?
    
    init(rowsCount: Int, columnsCount: Int, stepsCount: Double) {
        rowCount = rowsCount
        columnCount = columnsCount
        stepCount = stepsCount
        
        gameGrid = Grid(type: Block(color: Color.yellow), rows: rowCount, columns: columnCount)
        gameGrid.setAllToNil()
        
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(stepCount), repeats: true, block: { [weak self] _ in
            self?.gameLoop()
        })
    }
    
    func gameLoop() {
        move(in: .down)
        delegate?.render(grid: gameGrid)
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
    
    func rotate() {
        let rotated = currentShape.actualPositions(of: currentShape.getRotated())
        if isValidPosition(rotated)  {
            currentShape.rotate()
        }
        delegate?.render(grid: gameGrid)
    }
    
    func isMoveValid(in direction: Direction) -> Bool {
        return isValidPosition(currentShape.actualBlockPositions.map { shiftPosition($0, to: direction) })
    }
    
    func move(in direction: Direction) {
        if isMoveValid(in: direction) {
            currentShape.position = shiftPosition(currentShape.position, to: direction)
        } else if direction == Direction.down {
            endTurn()
        }
        delegate?.render(grid: gameGrid)
    }
    
    func endTurn() {
        for position in currentShape.actualBlockPositions {
            gameGrid.add(Block(color: currentShape.color), at: position)
        }
        gameGrid.checkLines()
        currentShape = BlockShape.random()
    }
    
}

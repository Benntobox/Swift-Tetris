//
//  Grid.swift
//  AdvancedTetris
//
//  Created by Benjamin Boyle on 2/10/18.
//  Copyright © 2018 Benjamin Boyle. All rights reserved.
//

import Foundation

class Grid<T> {
    var grid: [[T?]]
    let type: T
    let row: Int
    let column: Int
    
    init(type: T, rows: Int, columns: Int) {
        self.type = type
        row = rows
        column = columns
        grid = Array(repeatElement(Array<T>(repeatElement(type, count: row)), count: column))
    }
    
    subscript(index: Int) -> [T?] {
        return grid[index]
    }
    
    subscript(row: Int, column: Int) -> T? {
        get {
            return grid[column][row]
        }
        set {
            grid[column][row] = newValue
        }
    }
    
    func getPosition(_ position: Position) -> T? {
        return grid[position.row][position.column]
    }
    
    func isPositionFilled(at position: Position) -> Bool {
        return getPosition(position) != nil
    }
    
    func add(_ element: T, at position: Position) {
        grid[position.column][position.row] = element
    }
    
    func isLineFull(at line: Int) -> Bool {
        for pos in 0..<row {
            if grid[pos][line] == nil {
                return false
            }
        }
        return true
    }
    
//    func replaceLine(at line: Int) {
//        grid.remove(at: line)
//        var newLine: [T] = Array<T>(repeatElement(type, count: row))
//        grid.append(newLine)
//        setLineToNil(0)
//    }
    
//    func setLineToNil(_ line: Int) {
//        for index in 0..<row {
//            grid[line][index] = nil
//        }
//    }
    
    func setAllToNil() {
        for y in 0..<column {
            for x in 0..<row {
                grid[y][x] = nil
            }
        }
    }
    
    
}


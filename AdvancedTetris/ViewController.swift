//
//  ViewController.swift
//  AdvancedTetris
//
//  Created by Benjamin Boyle on 2/10/18.
//  Copyright © 2018 Benjamin Boyle. All rights reserved.
//

import UIKit

private let rowCount = 10
private let colCount = 16
private let stepCount = 1

class ViewController: UIViewController {
    
    var game = Tetris(rowsCount: rowCount, columnsCount: colCount, stepsCount: stepCount)
    var imageViewGrid = Grid(type: UIView(), rows: rowCount, columns: colCount)
    
    // Adds physically drawn square to each view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for col in 0..<colCount {
            for row in 0..<rowCount {
                let v = UIView()
                v.layer.borderWidth = 1
                v.layer.borderColor = UIColor.black.cgColor
                view.addSubview(v)
                imageViewGrid[row, col] = v
            }
        }
        refreshView()
    }
    
    func refreshView() {
        for col in 0..<colCount {
            for row in 0..<rowCount {
                if let square = game.gameGrid[row, col] {
                    imageViewGrid[row, col]!.backgroundColor = getColor(square.color)
                } else {
                    imageViewGrid[row, col]!.backgroundColor = UIColor.white
                }
            }
        }
    }
    
    func getColor(_ blockColor: Color) -> UIColor {
        let color: UIColor
        switch blockColor {
        case Color.blue:
            color = UIColor.blue
        case Color.red:
            color = UIColor.red
        case Color.green:
            color = UIColor.green
        case Color.orange:
            color = UIColor.orange
        case Color.yellow:
            color = UIColor.yellow
        case Color.purple:
            color = UIColor.purple
        case Color.pink:
            color = UIColor.gray
        default:
            color = UIColor.white
        }
        return color
    }

}


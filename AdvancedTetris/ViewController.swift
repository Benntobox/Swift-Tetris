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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        self.view.addGestureRecognizer(tapGesture)
        
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipe))
        leftSwipeGesture.direction = .left
        self.view.addGestureRecognizer(leftSwipeGesture)
        
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipe))
        rightSwipeGesture.direction = .right
        self.view.addGestureRecognizer(rightSwipeGesture)
        
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(downSwipe))
        downSwipeGesture.direction = .down
        self.view.addGestureRecognizer(downSwipeGesture)
        
    }
    
    @objc func tap() {
        game.currentShape.rotate()
        refreshView()
    }
    
    @objc func leftSwipe() {
        game.move(in: .left)
        refreshView()
    }
    
    @objc func rightSwipe() {
        game.move(in: .right)
        refreshView()
    }
    
    @objc func downSwipe() {
        game.move(in: .down)
        print(game.isMoveValid(in: .down))
        refreshView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var gameRect = view.bounds
        gameRect.size.height -= 50
        
        let colWidth = gameRect.width / CGFloat(rowCount)
        let rowHeight = gameRect.height / CGFloat(colCount)
        
        for col in 0..<colCount {
            for row in 0..<rowCount {
                let rect = CGRect(x: colWidth * CGFloat(row),
                                  y: rowHeight * CGFloat(col) + 20,
                                  width: colWidth,
                                  height: rowHeight)
                imageViewGrid[row, col]!.frame = rect
                print(imageViewGrid[row, col]!.frame)
            }
        }
        refreshView()
        //Start Here
    }
    
    func drawCurrentShape() {
        for position in game.currentShape.actualBlockPositions {
            imageViewGrid[position.row, position.column]!.backgroundColor = getColor(game.currentShape.color)
        }
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
        drawCurrentShape()
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


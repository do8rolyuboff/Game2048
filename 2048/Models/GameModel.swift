//
//  GameModel.swift
//  2048
//
//  Created by OUT-Dobrolyubov1-NN on 23.02.2021.
//

import UIKit

enum Tile {
    case empty
    case tile(Int)
}

//enum Move {
//    case up
//    case down
//    case left
//    case right
//}
//
//func move(direction: Move) -> Bool {
//    switch direction {
//    case .up:
//    case .down:
//    case .left:
//    case .right:
//    }
//}

struct Board {
    var tilesArray = [[Tile]]()
    let dimension = 4
    
    init(initialValue: Tile) {
        for _ in 0..<dimension {
            var subArray = [Tile]()
            for _ in 0..<dimension {
                subArray.append(initialValue)
            }
            tilesArray.append(subArray)
        }
    }
    subscript(row: Int, column: Int) -> Tile {
        get {
            return tilesArray[row][column]
        } set {
            tilesArray[row][column] = newValue
        }
    }
    
}

protocol GameModelProtocol : class {
    func setTiles(tiles: [((Int, Int), Int)])
}


class GameModel {
    var gameBoard: Board
    let delegate: GameModelProtocol
    
    init(delegate: GameModelProtocol) {
        gameBoard = Board(initialValue: .empty)
        self.delegate = delegate
    }
    
    
    func addTilesAnywhere(value: Int) {
        let emptyPositions = getArrayEmptyPositions()
        if !emptyPositions.isEmpty {
            let randomIndex = Int(arc4random_uniform(UInt32(emptyPositions.count - 1)))
            let (x, y) = emptyPositions[randomIndex]
            gameBoard[x, y] = .tile(value)
            delegate.setTiles(tiles: getCurrentTiles())
        }
    }

    
    func getCurrentTiles() -> [((Int, Int), Int)] {
        var tile = [((Int, Int), Int)]()
        for x in 0..<gameBoard.dimension {
            for y in 0..<gameBoard.dimension {
                if case let .tile(value) = gameBoard[x, y] {
                    tile.append(((x, y), value))
                }
            }
        }
        return tile
    }
    
    func getArrayEmptyPositions() -> [(Int, Int)] {
        var buffer = [(Int, Int)]()
        for x in 0..<gameBoard.dimension {
            for y in 0..<gameBoard.dimension {
                if case .empty = gameBoard[x, y] {
                    buffer.append((x, y))
                }
            }
        }
        return buffer
    }

    func swipeUp() {
        for y in 0..<gameBoard.dimension {
            
        }
    }
    
    func swipeDown() {
        for y in 0..<gameBoard.dimension {
            
        }
        
    }
    
    func swipeLeft() {
        for x in 0..<gameBoard.dimension {
            
        }
        
    }
    
    func swipeRight() {
        for x in 0..<gameBoard.dimension {
            
        }
    }
}

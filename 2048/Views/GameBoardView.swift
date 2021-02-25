//
//  GameBoardView.swift
//  2048
//
//  Created by OUT-Dobrolyubov1-NN on 23.02.2021.
//

import UIKit

class GameBoardView: UIView {
    
    let fieldSize = 4
    var tileWidth: CGFloat
    var tileFrame: CGFloat
    var cornerRadius: CGFloat
    
    let colorise = TileColorise()
    
    init(tileWidth width: CGFloat, tileFrame frame: CGFloat, cornerRadius radius: CGFloat) {
        tileWidth = width
        tileFrame = frame
        cornerRadius = radius
        let totalLength = CGFloat(fieldSize) * width + CGFloat(fieldSize + 1) * frame
        super.init(frame: CGRect(x: 0, y: 0, width: totalLength, height: totalLength))
        setupBackground()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBackground() {
        var x = tileFrame
        var y: CGFloat
        for _ in 0..<fieldSize {
            y = tileFrame
            for _ in 0..<fieldSize {
                let backgroundTile = UIView(frame: CGRect(x: x, y: y, width: tileWidth, height: tileWidth))
                backgroundTile.layer.cornerRadius = cornerRadius
                backgroundTile.backgroundColor = #colorLiteral(red: 0.7991226912, green: 0.7560110688, blue: 0.704044044, alpha: 1)
                addSubview(backgroundTile)
                y += tileFrame + tileWidth
            }
            x += tileFrame + tileWidth
        }
    }
    
    func setTiles(to tiles: [((Int, Int), Int)]) {
         for tile in tiles {
             let (x, y) = tile.0
             let value = tile.1
             var xPointer = tileFrame
             var yPointer: CGFloat
             for i in 0..<fieldSize {
                 yPointer = tileFrame
                 for j in 0..<fieldSize {
                     if j == x && i == y {
                         let tile = TileView(position: CGPoint(x: xPointer, y: yPointer), width: tileWidth, value: value, radius: cornerRadius, delegate: colorise)
                         addSubview(tile)
                     }
                     yPointer += tileFrame + tileWidth
                 }
                 xPointer += tileFrame + tileWidth
             }
         }
     }
}

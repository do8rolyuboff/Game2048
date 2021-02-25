//
//  TileView.swift
//  2048
//
//  Created by OUT-Dobrolyubov1-NN on 23.02.2021.
//

import UIKit

class TileView: UIView {
    var value: Int = 0 {
        didSet {
            backgroundColor = delegate.tileColor(value: value)
            numberLabel.textColor = delegate.numberColor(value: value)
            numberLabel.text = "\(value)"
        }
    }
    
    unowned let delegate: TileColoriseProtocol
    
    let numberLabel: UILabel
    
    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(position: CGPoint, width: CGFloat, value: Int, radius: CGFloat, delegate: TileColoriseProtocol) {
        self.delegate = delegate
        numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: width))
        numberLabel.textAlignment = NSTextAlignment.center
        numberLabel.minimumScaleFactor = 0.5
        
        super.init(frame: CGRect(x: position.x, y: position.y, width: width, height: width))
        addSubview(numberLabel)
        layer.cornerRadius = radius
        
        self.value = value
        backgroundColor = delegate.tileColor(value: value)
        numberLabel.textColor = delegate.numberColor(value: value)
        numberLabel.text = "\(value)"
    }
}

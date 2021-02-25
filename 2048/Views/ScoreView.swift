//
//  ScoreView.swift
//  2048
//
//  Created by OUT-Dobrolyubov1-NN on 20.02.2021.
//

import UIKit

class ScoreView : UIView {
  var score : Int = 0 {
    didSet {
      label.text = "SCORE: \(score)"
    }
  }

  let defaultFrame = CGRect(x: 0, y: 0, width: 140, height: 40)
  var label: UILabel

  init(backgroundColor bgcolor: UIColor, textColor tcolor: UIColor, font: UIFont, radius r: CGFloat) {
    label = UILabel(frame: defaultFrame)
    label.textAlignment = NSTextAlignment.center
    super.init(frame: defaultFrame)
    backgroundColor = bgcolor
    label.textColor = tcolor
    label.font = font
    layer.cornerRadius = r
    self.addSubview(label)
  }

  required init(coder aDecoder: NSCoder) {
    fatalError("NSCoding not supported")
  }
}

//
//class ScoreView: UIView {
//    var score: Int = 0 {
//        didSet {
//            label.text = "SCORE: \(score)"
//        }
//    }
//    let defaultFrame = CGRect(x: 0, y: 0, width: 140, height: 40)
//    var label: UILabel
//    init(backgroundColor bgcolor: UIColor, textColor tcolor: UIColor, font: UIFont, radius r: CGFloat) {
//        super.init(frame: defaultFrame)
//        layer.cornerRadius = r
//        backgroundColor = bgcolor
//
//        label = UILabel(frame: defaultFrame)
//        label.textAlignment = NSTextAlignment.center
//        label.textColor = tcolor
//        label.font = font
//        self.addSubview(label)
//    }
//
//    required init(coder: NSCoder) {
//        fatalError("NSCoding not supported")
//    }
//}

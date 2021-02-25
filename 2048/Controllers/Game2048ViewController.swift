//
//  Game2048ViewController.swift
//  2048
//
//  Created by OUT-Dobrolyubov1-NN on 20.02.2021.
//

import UIKit


class Game2048ViewController: UIViewController, GameModelProtocol {
    func setTiles(tiles: [((Int, Int), Int)]) {
        board!.setTiles(to: tiles)
    }
    
    var model: GameModel?
    var board: GameBoardView?
    
    let dimension = 4
    var boardWidth: CGFloat?
    let frame: CGFloat = 7.0
    let radius: CGFloat = 10.0
    var width: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGameBoard()
        setupSwipe()
        
        model = GameModel(delegate: self)

        model!.addTilesAnywhere(value: 2)
        model!.addTilesAnywhere(value: 2)
    }

    
    func setupSwipe() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeUp.direction = .up
        
//        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
//        swipeUp.direction = .down
//        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
//        swipeUp.direction = .left
//        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
//        swipeUp.direction = .right
        
        view.addGestureRecognizer(swipeUp)
//        view.addGestureRecognizer(downSwipe)
//        view.addGestureRecognizer(leftSwipe)
//        view.addGestureRecognizer(swipeRight)
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case .up:
                model!.swipeUp()
                model!.addTilesAnywhere(value: 2)
//            case .down:
////                model?.swipeDown()
//                model!.addTilesAnywhere(value: 2)
//            case .left:
////                model?.swipeLeft()
//                model!.addTilesAnywhere(value: 2)
//            case .right:
////                model?.swipeRight()
//                model!.addTilesAnywhere(value: 2)
            default:
                break
            }
        }
    }
    
//    @IBAction func swipeUp(_ sender: Any) {
//        self.model!.addTilesAnywhere(value: 2)
//    }
//    @IBAction func swipeDown(_ sender: Any) {
//        self.model!.addTilesAnywhere(value: 2)
//    }
//    @IBAction func swipeLeft(_ sender: Any) {
//        self.model!.addTilesAnywhere(value: 2)
//    }
//    @IBAction func swipeRight(_ sender: Any) {
//        self.model!.addTilesAnywhere(value: 2)
//    }
    
    func setupGameBoard() {
        let vcHeight = view.bounds.size.height
        let vcWidth = view.bounds.size.width
        boardWidth = vcWidth - frame * 2
        width = CGFloat(floorf(CFloat(boardWidth! - frame * CGFloat(dimension + 1))))/CGFloat(dimension)
        board = GameBoardView(tileWidth: width!, tileFrame: frame, cornerRadius: radius)
        view.backgroundColor = #colorLiteral(red: 0.9817053676, green: 0.9726935029, blue: 0.9377192259, alpha: 1)
        
        func xPositionToCenterView(_ v: UIView) -> CGFloat {
            let viewWidth = v.bounds.size.width
            let tentativeX = (vcWidth - viewWidth)/2
            return tentativeX >= 0 ? tentativeX : 0
        }
        
        func yPositionToCenterView(_ v: UIView) -> CGFloat {
            let viewHeight = v.bounds.size.height
            let tentativeY = (vcHeight - viewHeight)/2
            return tentativeY >= 0 ? tentativeY : 0
        }
        
        var f = board!.frame
        f.origin.x = xPositionToCenterView(board!)
        f.origin.y = yPositionToCenterView(board!)
        board!.frame = f
        
        view.addSubview(board!)
    }
}

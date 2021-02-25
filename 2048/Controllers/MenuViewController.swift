//
//  Game2048ViewController.swift
//  2048
//
//  Created by OUT-Dobrolyubov1-NN on 20.02.2021.
//

import UIKit

class MenuViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("START GAME", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1600896716, green: 0.1646011472, blue: 0.1861824989, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9882169366, blue: 0.9533235431, alpha: 1)
        view.addSubview(scrollView)
        scrollView.addSubview(startButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        let size = scrollView.width/3
        
        startButton.frame = CGRect(x: (scrollView.width-size)/2,
                                   y: 200,
                                   width: size,
                                   height: 52)

    }
    
    @objc private func startButtonTapped() {
        let vc = Game2048ViewController()
            
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}


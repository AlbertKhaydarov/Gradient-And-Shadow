//
//  ViewController.swift
//  GradientAndShadow
//
//  Created by Admin on 01.07.2023.
//

import UIKit

class ViewController: UIViewController {
    lazy var gradientAndShadowView = GradientAndShadowView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
  
        view.addSubview(gradientAndShadowView)
        setupView(gradientAndShadowView: gradientAndShadowView)
    }
    
    func setupView(gradientAndShadowView: UIView){
        gradientAndShadowView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            gradientAndShadowView.widthAnchor.constraint(equalToConstant: 100),
            gradientAndShadowView.heightAnchor.constraint(equalToConstant: 100),
            gradientAndShadowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            gradientAndShadowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}


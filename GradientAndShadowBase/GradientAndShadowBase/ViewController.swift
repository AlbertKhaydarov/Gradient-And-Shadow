//
//  ViewController.swift
//  GradientAndShadowBase
//
//  Created by Альберт Хайдаров on 19.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var cyanView = View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cyanView.layer.cornerRadius = 8
        cyanView.backgroundColor = .systemCyan
        view.addSubview(cyanView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cyanView.frame = .init(x: 100, y: cyanView.frame.origin.y, width: 120, height: 120)
        cyanView.center.y = view.frame.height / 2
    }
}
class View: UIView{
    
    let gradientlayer = CAGradientLayer()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .systemCyan
        layer.cornerCurve = .continuous
        
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .init(width: .zero, height: 12)
        layer.shadowRadius = 12
        
        gradientlayer.startPoint = .init(x: 0, y: 0)
        gradientlayer.endPoint = .init(x: 1, y: 0.5)
        gradientlayer.colors = [UIColor.systemRed.withAlphaComponent(0.1), UIColor.systemRed.cgColor]
        layer.addSublayer(gradientlayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        if layer == self.layer {
            gradientlayer.frame = bounds
            gradientlayer.cornerRadius = layer.cornerRadius
        }
    }
}

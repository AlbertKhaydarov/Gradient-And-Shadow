//
//  GradientView.swift
//  GradientAndShadow
//
//  Created by Admin on 01.07.2023.
//

import UIKit

class GradientAndShadowView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.roundCorners()
        self.addGragientEffect()
        self.addShadowEffect(cornerRadius: self.layer.cornerRadius, width: 5.0, height: 5.0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension UIView {
    func roundCorners() {
        self.layer.cornerRadius = 10
    }
    
    func addShadowEffect(cornerRadius: CGFloat, width: CGFloat, height: CGFloat){
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: width, height: height)
        layer.shadowOpacity = 1.0
        layer.frame = CGRect(origin: CGPoint(x: self.frame.origin.x + layer.shadowOffset.width, y: self.frame.origin.y +  layer.shadowOffset.height), size: CGSize(width: self.bounds.width, height: self.bounds.height))
        layer.shouldRasterize = true
    }
    
    func addGragientEffect(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor.systemCyan.cgColor, UIColor.systemRed.cgColor]
        gradientLayer.startPoint = CGPointMake(0.0, 0.0)
        gradientLayer.endPoint = CGPointMake(1.0, 0.5)
        gradientLayer.cornerRadius = self.layer.cornerRadius
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}

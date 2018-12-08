//
//  ImageViewSettings.swift
//  HomeWorkGeekBrains
//
//  Created by Kirill on 07/12/2018.
//  Copyright © 2018 Kirill. All rights reserved.
//

import UIKit


@IBDesignable class ImageViewSettings: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet{
            layer.shadowColor = shadowColor.cgColor
        }
    }

    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet{
            layer.shadowOffset = shadowOffset
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

     shadowLayer()
        
    }
    
    func shadowLayer() {
        
        let shadow = UIView(frame: self.frame)
        shadow.backgroundColor = UIColor.clear
        shadow.layer.shadowColor = shadowColor.cgColor
        shadow.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
        shadow.layer.shadowOffset = shadowOffset
        shadow.layer.shadowOpacity = shadowOpacity
        shadow.layer.shadowRadius = shadowRadius
        shadow.layer.masksToBounds = true
        shadow.clipsToBounds = false
        
        self.superview?.addSubview(shadow)
        self.superview?.bringSubviewToFront(self)
    }


    
}


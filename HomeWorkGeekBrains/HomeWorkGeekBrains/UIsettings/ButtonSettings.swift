//
//  ButtonSettings.swift
//  HomeWorkGeekBrains
//
//  Created by Kirill on 08/12/2018.
//  Copyright © 2018 Kirill. All rights reserved.
//

import UIKit

class ButtonSettings: UIButton {
    var isOn = true
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        initButton()
    }
    
    func initButton() {
        setImage(UIImage(named: "heart"), for: .normal)
        addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed()  {
        activateButton(bool: !isOn)
    }
    
    func activateButton(bool: Bool) {
        isOn = bool
        let img = bool ? "heart" : "heartSelected"
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
       
        if !bool {

            pulse.duration = 0.2
            pulse.fromValue = 1
            pulse.toValue = 1.15
            pulse.repeatCount = 1
            pulse.damping = 0.6
        }
        
        layer.add(pulse, forKey: "pulse")
        setImage(UIImage(named: img), for: .normal)
    }
}

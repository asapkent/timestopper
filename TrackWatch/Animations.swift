//
//  Animations.swift
//  TrackWatch
//
//  Created by Alex Jeffers on 6/27/19.
//  Copyright © 2019 JeffWorld. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        
        flash.duration = 0.3
        flash.fromValue = 1
        flash.toValue = 0.1
    }
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        
        pulse.duration = 0.4
        pulse.fromValue = 1
        pulse.toValue = 1.1
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 1
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
}

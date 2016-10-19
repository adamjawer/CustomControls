//
//  Extensions.swift
//  CustomControls
//
//  Created by Adam Jawer on 10/18/16.
//  Copyright © 2016 Adam Jawer. All rights reserved.
//

import UIKit

extension UIColor {
    class var defaultTrackTint: UIColor {
        return UIColor(red: 212.0/255.0, green: 212.0/255.0, blue: 212.0/255.0, alpha: 1)
    }
    
    class var defaultProgressTint: UIColor {
        return UIColor(red: 0, green: 118.0/255.0, blue: 1, alpha: 1)
    }
}

extension CGRect {
    var center: CGPoint {
        get {
            return CGPoint(
                x: origin.x + size.width / 2,
                y: origin.y + size.height / 2
            )
        }
    }
}

//
//  CircularProgressView.swift
//  CustomControls
//
//  Created by Adam Jawer on 10/18/16.
//  Copyright © 2016 Adam Jawer. All rights reserved.
//

import UIKit
import CoreGraphics

@IBDesignable
class CircularProgressView: UIView {

    @IBInspectable var trackTintColor: UIColor = UIColor.defaultTrackTint {
        didSet { setNeedsDisplay() }
    }
    
    @IBInspectable var progressTintColor: UIColor = UIColor.defaultProgressTint {
        didSet { setNeedsDisplay() }
    }
    
    private var _progress: Float = 0.0
    
    @IBInspectable var progress: Float {
        get {
            return _progress
        }
        
        set {
            if newValue < 0 {
                _progress = 0
            } else if newValue > 1 {
                _progress = 1
            } else {
                _progress = newValue
            }

            setNeedsDisplay()
        }
    }
    
    @IBInspectable var lineWidth: CGFloat = 10 {
        didSet { setNeedsDisplay() }
    }

    @IBInspectable var fontSize: CGFloat = 10 {
        didSet { setNeedsDisplay() }
    }
    
    @IBInspectable var enabled: Bool = true {
        didSet { setNeedsDisplay() }
    }
    
    var font: UIFont {
        get {
            return UIFont.systemFont(ofSize: fontSize)
        }
    }
    
    // redraw the control when the bounds change
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setNeedsDisplay()
    }

//    override func prepareForInterfaceBuilder() {
//        super.prepareForInterfaceBuilder()
//        
//        lineWidth = 20
//    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        func trackColor() -> UIColor {
            if enabled {
                return trackTintColor
            } else {
                return UIColor.lightGray
            }
        }
        
        func progressColor() -> UIColor {
            if enabled {
                return progressTintColor
            } else {
                return UIColor.darkGray
            }
        }
        
        // get the graphics context
        let context = UIGraphicsGetCurrentContext()
        
        //
        // Calculate the drawing rect
        //
        
        var diameter = min(bounds.width, bounds.height)
        
        // subtrack out the linewidth because the stroke width is centered on the path
        diameter -= lineWidth
        
        let drawRect = CGRect(
            x: (bounds.width - diameter) / 2,
            y: (bounds.height - diameter) / 2,
            width: diameter,
            height: diameter
        )
        
        // draw the track
        
        trackColor().setStroke()
        
        context?.setLineWidth(lineWidth)
        context?.strokeEllipse(in: drawRect)
        
        // Draw the indicator
        let circlePath = UIBezierPath(
            arcCenter: drawRect.center,
            radius: diameter / 2,
            startAngle: -CGFloat(M_PI / 2),
            endAngle: CGFloat(M_PI * 2) * CGFloat(progress) - CGFloat(M_PI / 2),
            clockwise: true
        )
        context?.addPath(circlePath.cgPath)
        
        progressColor().setStroke()
        
        context?.strokePath()
        
        // draw the text in the center
        
        let text = String(format: "%0.0f%%", round(progress * 100))
        
        // calculate the size of the string for attributes
        let attributes: [String : Any] = [NSFontAttributeName : font,
                          NSForegroundColorAttributeName: progressColor()]
        
        let textRect = (text as NSString).boundingRect(
            with: CGSize(width: Int.max, height: Int.max),
            options: [],
            attributes: attributes,
            context: nil
        )
        
        let point = CGPoint(
            x: (bounds.width - textRect.width) / 2,
            y: (bounds.height - textRect.height) / 2
        )
        
        (text as NSString).draw(at: point, withAttributes: attributes)
    }
}



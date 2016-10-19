//
//  CCToggleSwitch.swift
//  CustomControls
//
//  Created by Adam Jawer on 10/19/16.
//  Copyright © 2016 Adam Jawer. All rights reserved.
//

import UIKit

@IBDesignable class CCToggleSwitch: UIControl {
    
    var imageView: UIImageView!

    @IBInspectable var on: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
        
    @IBInspectable var imageOn: UIImage? {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var imageOff: UIImage? {
        didSet {
            setNeedsLayout()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupControl()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupControl()
    }
    
    @objc private func togglePan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            let location = gesture.location(in: self)
            if location.y < bounds.height / 2 {
                if !on {
                    on = true
                    sendActions(for: .valueChanged)
                }
            }
            else {
                if on {
                    on = false
                    sendActions(for: .valueChanged)
                }
            }
            break
            
        default:
            break
        }
    }
    
    func setupControl() {
        
        // add the Image View
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        addSubview(imageView)
        
        // add the gesture recognizer
        let panGesture = UIPanGestureRecognizer(
            target: self,
            action: #selector(togglePan(gesture:))
        )
            
        addGestureRecognizer(panGesture)
        
        setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard imageView != nil else { return }
        
        imageView.frame = self.bounds
        imageView.image = on ? imageOn : imageOff
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 40, height: 70)
    }
}

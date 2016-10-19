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

    @IBInspectable var isOn: Bool = false {
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
        
        backgroundColor = UIColor.clear
        
        guard imageView != nil else { return }
        
        imageView.frame = self.bounds
        imageView.image = isOn ? imageOn : imageOff
    }
    
    @objc private func togglePan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            let location = gesture.location(in: self)
            if location.y < bounds.height / 2 {
                if !isOn {
                    isOn = true
                    sendActions(for: .valueChanged)
                }
            }
            else {
                if isOn {
                    isOn = false
                    sendActions(for: .valueChanged)
                }
            }
            break
            
        default:
            break
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 40, height: 70)
    }
}

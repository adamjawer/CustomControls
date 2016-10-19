//
//  SquarePair.swift
//  CustomControls
//
//  Created by Adam Jawer on 10/19/16.
//  Copyright © 2016 Adam Jawer. All rights reserved.
//

import UIKit

class SquarePair: UIView {

    var leftSquare: UIView!
    var rightSquare: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialize()
    }
    
    func initialize() {
        leftSquare = UIView()
        leftSquare.backgroundColor = UIColor.red
        addSubview(leftSquare)
        
        rightSquare = UIView()
        rightSquare.backgroundColor = UIColor.blue
        addSubview(rightSquare)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        leftSquare.frame = CGRect(x: 0, y: 0, width: bounds.width / 2, height: bounds.height)
        rightSquare.frame = CGRect(x: bounds.width / 2, y: 0, width: bounds.width / 2, height: bounds.height)
    }
}









































/*
@IBDesignable
class SquarePair: UIView {
    
    @IBInspectable
    var leftColor: UIColor = UIColor.red {
        didSet {
            leftSquare.backgroundColor = leftColor
        }
    }
    
    @IBInspectable
    var rightColor: UIColor = UIColor.blue  {
        didSet {
            rightSquare.backgroundColor = rightColor
        }
    }
    
    var leftSquare: UIView!
    var rightSquare: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialize()
    }
    
    func initialize() {
        leftSquare = UIView()
        leftSquare.backgroundColor = UIColor.red
        addSubview(leftSquare)
        
        rightSquare = UIView()
        rightSquare.backgroundColor = UIColor.blue
        addSubview(rightSquare)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        leftSquare.frame = CGRect(x: 0, y: 0, width: bounds.width / 2, height: bounds.height)
        rightSquare.frame = CGRect(x: bounds.width / 2, y: 0, width: bounds.width / 2, height: bounds.height)
    }
    
}
*/

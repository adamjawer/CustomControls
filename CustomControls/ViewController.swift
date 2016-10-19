//
//  ViewController.swift
//  CustomControls
//
//  Created by Adam Jawer on 10/19/16.
//  Copyright © 2016 Adam Jawer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView_1: CircularProgressView!
    @IBOutlet weak var progressView_2: CircularProgressView!
    @IBOutlet weak var progressView_3: CircularProgressView!
    @IBOutlet weak var progressView_4: CircularProgressView!
    
    @IBAction func switchToggled(_ sender: CCToggleSwitch) {
        switch sender.tag {
        case 1:
            progressView_1.enabled = sender.on
            
        case 2:
            progressView_2.enabled = sender.on
            
        case 3:
            progressView_3.enabled = sender.on
            
        case 4:
            progressView_4.enabled = sender.on
            
        default:
            break;
        }
    }
}


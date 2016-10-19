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
    
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider3: UISlider!
    @IBOutlet weak var slider4: UISlider!
    
    var controls: [(CircularProgressView, UISlider)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        controls = [(progress: progressView_1, slider: slider1),
                    (progress: progressView_2, slider: slider2),
                    (progress: progressView_3, slider: slider3),
                    (progress: progressView_4, slider: slider4)]
        
        for (progressView, slider) in controls {
            slider.value = progressView.progress
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        controls[sender.tag].0.progress = sender.value
    }
    
    @IBAction func switchToggled(_ sender: CCToggleSwitch) {
        let (progressView, slider) = controls[sender.tag]
        progressView.enabled = sender.isOn
        slider.isEnabled = sender.isOn
    }
}


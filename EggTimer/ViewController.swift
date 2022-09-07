//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    weak var timer: Timer?
    
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft" : 5, "Medium" : 7, "Hard" : 12]
    var totalTime = 0  // globally recognized
    var secondPassed = 0
    var progressGrew : Float = 0.0
    @IBAction func hardNessSelector(_ sender: UIButton) {
        timer?.invalidate()
        progressBar.progress = 0
        secondPassed = 0
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    @objc func updateCounter() {
        if secondPassed < totalTime {
            print("\(secondPassed) seconds passed")
            secondPassed += 1
            progressGrew = Float(secondPassed) / Float(totalTime)
            progressBar.progress = progressGrew
                    } else {
            timer?.invalidate()
        }
    }
    
}

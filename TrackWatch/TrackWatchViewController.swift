//
//  ViewController.swift
//  TrackWatch
//
//  Created by Alex Jeffers on 5/1/19.
//  Copyright © 2019 JeffWorld. All rights reserved.
//

import Foundation
import UIKit 

class TrackWatchViewController: UIViewController {

   
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var timeKeeper: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var timer = Timer()
    var istimerRunning = false
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = black
        
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        
        startButton.setTitleColor(lime, for: UIControl.State.normal)
        pauseButton.setTitleColor(red, for: UIControl.State.normal)
        
        timeKeeper.layer.cornerRadius = 5.0
        timeKeeper.layer.masksToBounds = true

        resetButton.layer.cornerRadius = 4.0
        resetButton.layer.masksToBounds = true
        resetButton.isEnabled = false
        resetButton.alpha = 0.5

        startButton.layer.cornerRadius = startButton.bounds.width / 2.0
        startButton.layer.masksToBounds = true

        pauseButton.layer.cornerRadius = pauseButton.bounds.width / 3.0
        pauseButton.layer.masksToBounds = true
        pauseButton.isEnabled = false
        pauseButton.alpha = 0.5
    }

    @IBAction func startButtonPressed(_ sender: UIButton) {
        
        if !istimerRunning {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
           
            istimerRunning = true
            
            resetButton.isEnabled = true
            pauseButton.isEnabled = true
            startButton.isEnabled = false
            
            resetButton.alpha = 1.0
            startButton.alpha = 0.5
            pauseButton.alpha = 1.0
            
            sender.pulsate()

        }
    }
    
    @IBAction func pauseButtonPressed(_ sender: UIButton) {
//        if pauseButton.isEnabled == false {
//            pauseButton.backgroundColor = black
//        } else if
//            pauseButton.isEnabled == true {
//            pauseButton.backgroundColor = red
//        }
            resetButton.isEnabled = true
            startButton.isEnabled = true
            pauseButton.isEnabled = false
        
            resetButton.alpha = 1.0
            startButton.alpha = 1.0
            pauseButton.alpha = 0.5
        
            istimerRunning = false
            timer.invalidate()
        
        sender.pulsate()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        istimerRunning = false
        counter = 0.0
        
        timeKeeper.text = "00:00:00.0"
        
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        
        resetButton.alpha = 0.5
        startButton.alpha = 1.0
        pauseButton.alpha = 0.5
        
        sender.pulsate()
    }
    
    @objc func runTimer()  {
      counter += 0.1
        let baseCounter = Int(floor(counter))
        let hour = baseCounter / 3600
        let minute = (baseCounter % 3600 ) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        
        let second = (baseCounter % 3600) % 60
        var secondString = "\(second)"
        if second < 10 {
            secondString = "0\(second)"
        }
        //timeKeeper.text = "\(counter)"
        let deSecond = String(format: "%.1f", counter).components(separatedBy: ".").last!
        
        timeKeeper.text = "\(hour):\(minuteString):\(secondString).\(deSecond)"
    }
}



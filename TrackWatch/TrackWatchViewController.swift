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

    @IBOutlet weak var restButton: UIButton!
    @IBOutlet weak var timeKeeper: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var timer = Timer()
    var istimerRunning = false
    var counter = 0.0
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        startButton.backgroundColor = blackTranslucent
//        pauseButton.backgroundColor = blackTranslucent
//        restButton.backgroundColor = blackTranslucent
        view.backgroundColor = black
        //timeKeeper.backgroundColor = snow
        restButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
    }


    @IBAction func startButtonPressed(_ sender: UIButton) {
        
//        if startButton.backgroundColor == blackTranslucent {
//            startButton.backgroundColor = lime
//        } else  if
//            startButton.backgroundColor == lime {
//                startButton.backgroundColor = blackTranslucent
//            }
        if !istimerRunning {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
           
            istimerRunning = true
            restButton.isEnabled = true
            pauseButton.isEnabled = true
            startButton.isEnabled = false
        }
    }
    
    @IBAction func pauseButtonPressed(_ sender: UIButton) {
//        if pauseButton.backgroundColor == blackTranslucent {
//            pauseButton.backgroundColor = red
//        } else if
//            pauseButton.backgroundColor == red {
//            pauseButton.backgroundColor = blackTranslucent
//        }
            restButton.isEnabled = true
            startButton.isEnabled = true
            pauseButton.isEnabled = false
        
            istimerRunning = false
            timer.invalidate()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        istimerRunning = false
        counter = 0.0
        
        timeKeeper.text = "00:00:00.0"
        
        restButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
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



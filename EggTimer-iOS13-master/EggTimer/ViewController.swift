//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //초기화
    let eggTimes = ["Soft" : 3, "Medium" : 4, "Hard" : 5]
    
    var seconds = 60
    var progressTime = 100
    var timer = Timer()
    
    @IBOutlet weak var timerBar: UIProgressView!
    @IBOutlet weak var timerText: UILabel!
    @IBAction func HardnessSelected(_ sender: UIButton){
        
        timerBar.progress = 1.0
        timer.invalidate() //초기화
        timerBar.tag = 1
        let hardness = sender.currentTitle!
        
        seconds = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTime()
    {
        if(seconds > 0)
        {
            seconds -= 1
        //    timerBar.setProgress(<#T##progress: Float##Float#>, animated: <#T##Bool#>)
        }else{
            timer.invalidate()
            timerText.text = "완료"
        } 
        
        print("\(seconds) seconds.")
    }
}

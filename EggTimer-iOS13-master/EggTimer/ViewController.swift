//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation //Audio Viusal Foundation Module

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    //초기화
    let eggTimes = ["Soft" : 360, "Medium" : 520, "Hard" : 700]
    
    var progressTime = 100
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var timerBar: UIProgressView!
    @IBOutlet weak var timerText: UILabel!
    @IBAction func HardnessSelected(_ sender: UIButton){
        
        
        timer.invalidate() //초기화
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        timerBar.progress = 0.0
        secondsPassed = 0
        timerText.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTime()
    {
        if(secondsPassed < totalTime)
        {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            timerBar.setProgress(percentageProgress, animated: true)
            
        }else{
            
            timer.invalidate()
            timerText.text = "완료"
            timerBar.progress = 1
            alarmSound()
            
        } 
    
    }
    
    func alarmSound()
    {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

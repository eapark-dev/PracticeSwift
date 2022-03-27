//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation //Audio Viusal Foundation Module

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {

        UIView.animate(withDuration: 0.2, animations: {
            sender.alpha  = 0.5;
            print("start")
        },completion : {_ in sender.alpha = 1; print("end")})
        
//        //Reduces the sender's (the button that got pressed) opacity to half.
//        sender.alpha = 0.5
//
//        //Code should execute after 0.2 second delay.
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//            //Bring's sender's opacity back up to fully opaque.
//            sender.alpha = 1.0
//        }
        
        
        let buttonTitle = sender.currentTitle as Any
        playSound(musicName: buttonTitle as! String)
    }
    
    func playSound(musicName : String ) {
        
        let url = Bundle.main.url(forResource: musicName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

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
    let eggTimes = ["Soft" : 5, "Medium" : 7, "Hard" : 12]
    
    @IBAction func HardnessSelected(_ sender: UIButton){
        
        let hardness = sender.currentTitle!
   
        print(eggTimes[hardness]!)
        
    }
    
}

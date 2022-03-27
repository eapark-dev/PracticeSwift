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
    let softTime = 5
    let mediumTime = 8
    let hardTime = 12
    
    @IBAction func HardnessSelected(_ sender: UIButton){
        
        let hardness = sender.currentTitle
        
        if(hardness == "Soft")
        {
            print(softTime)
        }else if(hardness == "Medium")
        {
            print(mediumTime)
        }else {
            print(hardTime)
        }
        
    }
    
}

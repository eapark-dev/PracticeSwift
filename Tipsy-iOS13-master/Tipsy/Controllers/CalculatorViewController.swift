//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
        
    @IBAction func tipChanged(_ sender: UIButton) {
        
        let currentTitle = sender.currentTitle!
        
        switch currentTitle {
            case "0%" :
                zeroPctButton.isSelected = true
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = false
                print("0.0")
            case "10%" :
                zeroPctButton.isSelected = false
                tenPctButton.isSelected = true
                twentyPctButton.isSelected = false
                print("0.1")
            case "20%" :
                zeroPctButton.isSelected = false
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = true
                print("0.2")
            default :
                zeroPctButton.isSelected = false
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = false
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
    }
}


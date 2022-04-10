//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var pct = 0.0
    var number = 0
    var total = 0.0
    var billTotal = 0.0
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
        
    @IBAction func tipChanged(_ sender: UIButton) {

        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true

        billTextField.endEditing(true)
        
        pct = Double(String(sender.currentTitle!.dropLast()))! / 100

    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format:"%.0f",sender.value)
        number = Int(sender.value)
        
        billTextField.endEditing(true)
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let billValue = billTextField.text!
        if billValue != "" {
            billTotal = Double(billValue)!
            total = billTotal * (pct + 1) / Double(number)
        }
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.number = number
            destinationVC.pct = Int(pct * 100)
            destinationVC.total = String(format:"%.2f",total)
        }
    }
}


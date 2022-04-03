//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightChanged(_ sender: UISlider) {
        let height = String(format:"%.2f",sender.value)
        heightLabel.text = "\(height)m"
    }

    @IBAction func weightChanged(_ sender: UISlider) {
        let weight = String(format:"%.0f",sender.value)
        weightLabel.text = "\(weight)kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        //제곱 계산 함수 pow
        let bmi = weight/(height*height)
        print(bmi)
        
    }
    
}


//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var bmi = "0.0"
    
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
        bmi = String(format:"%.1f",weight/(height*height))

        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    //segue 초기화
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController //as! 다운 캐스트
            destinationVC.bmiValue = bmi
        }
    }
    
}


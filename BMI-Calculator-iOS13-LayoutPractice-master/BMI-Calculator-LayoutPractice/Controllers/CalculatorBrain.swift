//
//  CalculatorBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by 박은아 on 2022/04/06.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain{
    
    var bmiValue: BMI? //?optional 처리
    
    mutating func calculateBMI(height:Float, weight: Float){
        let bmi =  weight / (height*height)
        
        if bmi < 18.5 {
            bmiValue = BMI(value: bmi, advice: "Eat more pies!", color:#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        }else if bmi < 24.9{
            bmiValue = BMI(value: bmi, advice: "Fit as a fiddle", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        }else {
            bmiValue = BMI(value: bmi, advice: "Eat less pies!", color: #colorLiteral(red: 0.6071043611, green: 0.1114692912, blue: 0.12189693, alpha: 1))
        }
    }
    
    func getBMIBValue() -> String{
        return String(format:"%.1f",bmiValue?.value ?? 0.0)
    }
    
    func getAdvice() -> String{
        return bmiValue?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor{
        return bmiValue?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}

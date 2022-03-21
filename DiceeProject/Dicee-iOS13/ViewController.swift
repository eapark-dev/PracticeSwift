//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
        
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        //Int.random(숫자..숫자) -> 랜덤으로 해당 범위에서 숫자 가져오기
        print("call rollButtonPressed")
        
        let diceArray = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")]
        
        //대괄호 컬렉션을 보유하는 데 사용
        diceImageView1.image =  diceArray[Int.random(in: 0...5)]
        
        diceImageView2.image =  diceArray[Int.random(in: 0...5)]
        
       
        
    }
    
}


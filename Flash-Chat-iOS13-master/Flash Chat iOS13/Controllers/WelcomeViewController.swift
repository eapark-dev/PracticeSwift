//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
//import CLTypingLabel

class WelcomeViewController: UIViewController {

    //@IBOutlet weak var titleLabel: CLTypingLabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //cocoapods 사용한 경우
     //   titleLabel.text = "⚡️FlashChat"

        //코딩으로 만든 경우
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = K.appName
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval:0.1 * charIndex, repeats: false) { (timer) in self.titleLabel.text?.append(letter)
            }
            charIndex += 1

        }
    }
}

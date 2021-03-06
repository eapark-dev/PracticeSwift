//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by 박은아 on 2022/04/09.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLbael: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var pct = 0
    var number = 0
    var total = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLbael.text = total
        settingsLabel.text = "Split between \(number) people, with \(pct)% tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        //이전으로
        self.dismiss(animated: true, completion: nil)
        
    }
    
}

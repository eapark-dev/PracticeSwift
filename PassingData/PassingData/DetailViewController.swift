//
//  DetailViewController.swift
//  PassingData
//
//  Created by 박은아 on 2022/06/07.
//

import UIKit

class DetailViewController: UIViewController {

    var someString = ""
    
    @IBOutlet weak var someLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        someLabel.text = someString
    }

}

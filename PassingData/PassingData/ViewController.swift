//
//  ViewController.swift
//  PassingData
//
//  Created by 박은아 on 2022/06/07.
//

// 데이터 넘겨주는 방법
// 6가지
// 1. instance property

import UIKit

class ViewController: UIViewController {
    
    var someString = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveToDetail(_ sender: UIButton) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
       // detailVC.someString = "스트링"
 
        self.present(detailVC, animated: true, completion:  nil)
        
        detailVC.someLabel.text = "aaa"
    }
    
}

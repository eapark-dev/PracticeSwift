//
//  ViewController.swift
//  PassingData
//
//  Created by 박은아 on 2022/06/07.
//

// 데이터 넘겨주는 방법
// 6가지
// 1. instance property
// 2. 세그웨이 방법 s

import UIKit

class ViewController: UIViewController {
    
    var someString = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sugueDetail" {
            //화살표가 연결된 목적지
            if let detailVC = segue.destination as? SeguDetailViewController {
                detailVC.dataString = "abccc"
            }
        }
    }
    

    @IBAction func moveToDetail(_ sender: UIButton) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
       // detailVC.someString = "스트링"
        detailVC.someLabel.text = "aaa"
        self.present(detailVC, animated: true, completion:  nil)
        
   
    }
    
}

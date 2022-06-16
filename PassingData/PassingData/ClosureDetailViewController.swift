//
//  ClosureDetailViewController.swift
//  PassingData
//
//  Created by 박은아 on 2022/06/16.
//

import UIKit

class ClosureDetailViewController: UIViewController {

    //변수를 closure로 만듦
    //초기화
    var myClosure: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func closurePassData(_ sender: UIButton) {
        
        myClosure?("closure string")
        self.dismiss(animated: true, completion: nil)
    }
}

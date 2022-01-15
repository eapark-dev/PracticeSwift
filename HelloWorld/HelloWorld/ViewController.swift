//
//  ViewController.swift
//  HelloWorld
//
//  Created by 박은아 on 2022/01/13.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func Click_moveBtn(_ sender: Any) {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailController"){
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}


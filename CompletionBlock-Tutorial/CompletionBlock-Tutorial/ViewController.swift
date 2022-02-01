//
//  ViewController.swift
//  CompletionBlock-Tutorial
//
//  Created by 박은아 on 2022/02/01.
//

import UIKit
import KRProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var mainTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("viewDidLoad 호출")
        
        KRProgressHUD.show()
        sayHi(completion: { result in
            
            print("컴플레이션 블락으로 넘겨받았음:  \(result)")
            
            KRProgressHUD.showSuccess()
            
            self.mainTitle.text = result
        })
    }


    fileprivate func sayHi(completion: @escaping(String)-> ()){
     
        print("sayHi 호출됨")
        
        //비동기 처리 2초 딜레이 줌
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
           // Code you want to be delayed
            //print("2초뒤 호출")'
            completion("Hi")
        }
    }
}


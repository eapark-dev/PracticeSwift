//
//  ViewController.swift
//  NavigationViewController_tutorial
//
//  Created by 박은아 on 2022/01/25.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //상단 네비게이션 바 부분을 숨김 처리한다.
        self.navigationController?.isNavigationBarHidden = true
        
        loginBtn.addTarget(self, action: #selector(moveToMainViewController), for: .touchUpInside)
    }

    //메인 화면으로 이동
    @objc fileprivate func moveToMainViewController(){
        print("LoginViewController - moveToMainViewController() called")
        
        let mainViewController = MainViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
}


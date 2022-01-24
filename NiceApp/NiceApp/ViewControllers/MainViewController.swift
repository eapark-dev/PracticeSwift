//
//  ViewController.swift
//  NiceApp
//
//  Created by 박은아 on 2022/01/24.
//

import UIKit
import Lottie

class MainViewController: UIViewController {

    let titleLable : UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "메인화면"
        label.font = UIFont.boldSystemFont(ofSize: 70)
        return label
    }()
    
    //선언하면서 정의하는 방법 {}()
    let animationView: AnimationView = {
        let animView = AnimationView(name: "12358-christmas-loading")
        animView.frame = CGRect(x:0, y:0, width:400, height: 400) //frame : 크기 지정
        animView.contentMode = .scaleAspectFill //크기에 맞도록 채우기
        
        return animView
    }()
    
    //view가 생성되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .black
        view.addSubview(animationView)
        animationView.center = view.center
        
        // 애니매이션 실행
        animationView.play{ (finish) in
            //
            print("애니매이션 종료")
            
            self.view.backgroundColor = .white
            
            self.animationView.removeFromSuperview()
            
            self.view.addSubview(self.titleLable)
            
            self.titleLable.translatesAutoresizingMaskIntoConstraints = false
            self.titleLable.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.titleLable.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        }
        
        
    }

}


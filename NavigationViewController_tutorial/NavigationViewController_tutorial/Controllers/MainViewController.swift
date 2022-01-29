//
//  MainViewController.swift
//  NavigationViewController_tutorial
//
//  Created by 박은아 on 2022/01/29.
//

import UIKit

class MainViewController : UIViewController {
    
    //제목
    var titleLable : UILabel = {
        let label = UILabel()
        label.text = "메인화면"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = UIColor.white
        return label
    }()
    
    let changeBtn : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("배경색 바꾸기", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 5
     //   btn.contentEdgeInsets = UIEdgeInsets(top:5, left: 20, bottom: 5, right: 20)
        btn.addTarget(self, action: #selector(changeBg), for: .touchUpInside)
        return btn
    }()
    
    var isBgBlack : Bool?
    
    // 뷰가 생성되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isBgBlack = true
        
        let BACKGROUND = UIColor(named: "Background")
        view.backgroundColor = BACKGROUND
        view.addSubview(titleLable)
        
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(changeBtn)
        changeBtn.translatesAutoresizingMaskIntoConstraints = false
        changeBtn.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant :20).isActive = true
        changeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    //배경색을 바꾼다.
    //fileprivate => 이 클래스에서만 사용한다.
    @objc fileprivate func changeBg(){
    
        if isBgBlack == true {
            //
            view.backgroundColor = UIColor.blue
            isBgBlack = false
        }else {
            view.backgroundColor = UIColor.black
            isBgBlack = true
        }
        
        print("MainViewController - changeBg() called / isBgBlack : \(isBgBlack)" )
    }
}

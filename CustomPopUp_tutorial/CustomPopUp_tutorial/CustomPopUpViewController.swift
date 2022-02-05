//
//  CustomPopUpViewController.swift
//  CustomPopUp_tutorial
//
//  Created by 박은아 on 2022/02/05.
//

import UIKit

class CustomPopUpViewController : UIViewController {
    
    @IBOutlet weak var bgBtn: UIButton!
    @IBOutlet weak var subscribeBtn: UIButton!
    @IBOutlet weak var contentView: UIView!
    
    var subscribeBtnCompletionClosure: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopUpViewController -viewDidLoad Called")
        
        contentView.layer.cornerRadius = 30
        subscribeBtn.layer.cornerRadius = 10
    }
    
    @IBAction func onBgBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onBgBtnClicked() called")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func onSubscribeBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onSubscribeBtnClicked() called")
        
        self.dismiss(animated: true, completion: nil)
        
        // 컴플레션 블럭 호출
        if let subscribeBtnCompletionClosure = subscribeBtnCompletionClosure {
            // 메인에 알린다.
            subscribeBtnCompletionClosure()
        }
        
    }
}

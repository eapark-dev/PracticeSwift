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
    
    @IBOutlet weak var openChatBtn: UIButton!
    
    @IBOutlet weak var onBlogBtn: UIButton!
    
    var subscribeBtnCompletionClosure: (() -> Void)?
    
    var myPopUpDelegate : PopUpDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopUpViewController -viewDidLoad Called")
        
        contentView.layer.cornerRadius = 30
        subscribeBtn.layer.cornerRadius = 10
        openChatBtn.layer.cornerRadius = 10
        onBlogBtn.layer.cornerRadius = 10
    }
    
    //MARK: - IBActions
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
    
    @IBAction func onBlogBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onBlogBtnClicked() called")
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationName), object: nil)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onOpenChatBtnClicked(_ sender: UIButton) {
        
        print("CustomPopUpViewController - onOpenChatBtnClicked() called")
        
        //해당 버튼을 클릭함
        myPopUpDelegate?.onOpenChatBtnClicked()
        self.dismiss(animated: true, completion: nil)
    }
}

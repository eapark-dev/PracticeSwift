//
//  ViewController.swift
//  CustomPopUp_tutorial
//
//  Created by 박은아 on 2022/02/05.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var createPopUpBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onCreatePopUpBtnClicked(_ sender: UIButton) {
        print("ViewController - onCreatePopUpBtnClicked() called")
        
        //스토리보드 가져오기
        let storyboard = UIStoryboard.init(name: "PopUp", bundle: nil)
        //스토리보드를 통해 뷰컨트롤러 가져오기
        let customPopUpVC = storyboard.instantiateViewController(withIdentifier: "AlertPopUpVC") as! CustomPopUpViewController
        //팝업효과 설정
        //뷰컨트롤러가 보여지는 스타일
        customPopUpVC.modalPresentationStyle = .overCurrentContext
        //뷰컨트롤러가 사라지는 스타일
        customPopUpVC.modalTransitionStyle = .crossDissolve
        
        customPopUpVC.subscribeBtnCompletionClosure = {
            print("컴플레션 블럭이 호출되었다. ")
            let myChannelUrl = URL(string: "https://www.youtube.com/channel/UCutO2H_AVmWHbzvE92rpxjA")
            self.myWebView.load(URLRequest(url: myChannelUrl!))
        }
        
        self.present(customPopUpVC, animated: true, completion: nil)
    }
}


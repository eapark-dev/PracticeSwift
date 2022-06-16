//
//  DelegateDetailViewController.swift
//  PassingData
//
//  Created by 박은아 on 2022/06/14.
//

import UIKit

//프로토콜에 규격화 되서 사용됨
//프로토콜 : 정의만 되어있고 내용은 없음
protocol DelegateDetailViewControllerDelegate: AnyObject {
    func passString(string: String)
}

class DelegateDetailViewController: UIViewController {
    
    //weak 타입 사용하려면 AnyObject 참조 해야함
    //구현 후에 사용할 때만 사용하고 없어져야 해서 weak 타입으로 함
    weak var delegate: DelegateDetailViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func passDataToMainVC(_ sender: UIButton) {
        delegate?.passString(string: "delegate pass Data")
    }
    

}

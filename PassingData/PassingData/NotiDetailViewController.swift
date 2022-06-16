//
//  NotiDetailViewController.swift
//  PassingData
//
//  Created by 박은아 on 2022/06/16.
//

import UIKit

class NotiDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func notiAction(_ sender: Any) {
        
        let notificationName = Notification.Name("sendSomeString")
        let strDic = ["str" : "noti string"]
        
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: strDic)
    }
}

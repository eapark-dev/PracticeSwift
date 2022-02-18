//
//  BaseVC.swift
//  Fundamental_tutorial
//
//  Created by 박은아 on 2022/02/18.
//

import UIKit

class BaseVC : UIViewController {
    
    var vcTitle : String = "" {
        didSet {
            print("UserListVC - vcTitle didSEt() called / vcTitle : \(vcTitle)")
            self.title = vcTitle
        }
    }
}

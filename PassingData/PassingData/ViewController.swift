//
//  ViewController.swift
//  PassingData
//
//  Created by 박은아 on 2022/06/07.
//

// 데이터 넘겨주는 방법
// 6가지
// 1. instance property
// 2. 세그웨이 방법 s
// 3. instance
// 4. delegate (delegation) pattern 대리 위임
// 5. closureß
// 6. Notification

import UIKit

class ViewController: UIViewController {
    
    var someString = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationName = Notification.Name("sendSomeString")
        NotificationCenter.default.addObserver(self, selector: #selector(showSomeString), name: notificationName, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(show), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    @objc func keyboardWillShow() {
        print("wii show")
    }
    
    @objc func keyboardDidShow() {
        print("did show")
    }
    
    @objc func showSomeString(notification: Notification) {
        if let str = notification.userInfo?["str"] as? String {
            self.dataLabel.text = str
        }
    }
    
    
    
    @IBOutlet weak var dataLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sugueDetail" {
            //화살표가 연결된 목적지
            if let detailVC = segue.destination as? SeguDetailViewController {
                detailVC.dataString = "abccc"
            }
        }
    }
    

    @IBAction func moveToDetail(_ sender: UIButton) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
       // detailVC.someString = "스트링"
        detailVC.someLabel.text = "aaa"
        self.present(detailVC, animated: true, completion:  nil)
        
   
    }
    
    //delegate 방법
    @IBAction func moveToDelegate(_ sender: UIButton) {
        let detailVC = DelegateDetailViewController(nibName: "DelegateDetailViewController", bundle: nil)
        detailVC.delegate = self
        self.present(detailVC, animated: true, completion: nil)
    }
    
    
    //instance방법
    
    @IBAction func moveToInstance(_ sender: UIButton) {
        let detailVC = InstanceDetailViewController(nibName: "InstanceDetailViewController", bundle: nil)
        detailVC.mainVC = self
        self.present(detailVC, animated: true, completion: nil)
    }
    
    
    @IBAction func moveToClosure(_ sender: UIButton) {
        let detailVC = ClosureDetailViewController(nibName: "ClosureDetailViewController", bundle: nil)
        //구현부
        detailVC.myClosure = {str in
            self.dataLabel.text = str
        }
        self.present(detailVC, animated: true, completion: nil)
    }
    
    
    @IBAction func moveToNoti(_ sender: Any) {
        let detailVC = NotiDetailViewController(nibName: "NotiDetailViewController", bundle: nil)
        self.present(detailVC, animated: true, completion: nil)
    }
    
}

extension ViewController: DelegateDetailViewControllerDelegate {
    func passString(string: String) {
        self.dataLabel.text = string
    }
}

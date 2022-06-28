//
//  InstanceDetailViewController.swift
//  PassingData
//
//  Created by 박은아 on 2022/06/14.
//

import UIKit

class InstanceDetailViewController: UIViewController {

    //나 자신에 대한 instance를 넘김
    var mainVC: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendDataMainVc(_ sender: UIButton) {
        mainVC?.dataLabel.text = "some data"
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation
     #imageLiteral(resourceName: "simulator_screenshot_92E24506-DF05-4188-9732-CA96D1B838C7.png")
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  NewsDetailController.swift
//  sentiTable
//
//  Created by 박은아 on 2022/01/19.
//

import UIKit

class NewsDetailController : UIViewController {
    
    
    @IBOutlet weak var ImageMain: UIImageView!
    @IBOutlet weak var LabelMain: UILabel!
    
    //1. image url
    //2. description
    
    var imageUrl: String?
    var desc : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //값이 있으면
        if let img = imageUrl {
            //이미지를 가져와서 뿌린다.
            //Data
            if let data = try? Data(contentsOf: URL(string: img)!){
                //Main Thread
                DispatchQueue.main.async {
                    self.ImageMain.image = UIImage(data: data)
                }
                
            }
        }
        
        if let d = desc {
            //뉴스 본문을 보여준다.
            self.LabelMain.text = d
        }
    }
}

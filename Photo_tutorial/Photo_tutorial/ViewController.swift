//
//  ViewController.swift
//  Photo_tutorial
//
//  Created by 박은아 on 2022/02/10.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileChangeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //self 입력 시 뷰컨트롤러 안에 있는 이미지뷰이다.
        self.profileImage.layer.cornerRadius = profileImage.frame.height / 2
        self.profileChangeBtn.layer.cornerRadius = 10
        
        // 버튼클릭 액션 설정
        self.profileChangeBtn.addTarget(self, action: #selector(onProfileChangeBtnClicked), for: .touchUpInside)
    }
 
    // 프사 변경 버튼이 클릭되었을 때
    @objc fileprivate func onProfileChangeBtnClicked(){
        print("ViewController - onProfileChangeBtnClicked() called")
        
        //카메라 라이브러리 세팅
        var config = YPImagePickerConfiguration()
        config.screens = [.library,.photo, .video]
        //config.screens = [.library]
        
        let picker = YPImagePicker()
        
        //사진 선택 되었을 때
        picker.didFinishPicking { [unowned picker] items, _ in
            
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                //프사 이미지를 변경한다.
                self.profileImage.image = photo.image
            }
            
            // 사진 선택창 닫기
            picker.dismiss(animated: true, completion: nil)
        }
        //사진 선택창 보여주기
        present(picker, animated: true, completion: nil)
    }

}


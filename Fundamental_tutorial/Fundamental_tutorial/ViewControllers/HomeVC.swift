//
//  ViewController.swift
//  Fundamental_tutorial
//
//  Created by 박은아 on 2022/02/14.
//

import UIKit
import Toast_Swift
import Alamofire

class HomeVC: UIViewController, UISearchBarDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var searchFilterSegment: UISegmentedControl!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var searchIndicator: UIActivityIndicatorView!
    
    var keyboardDismissTabGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: nil)
    
    //MARK: - override method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("HomeVC - viewDidLoad() called")
        //ui 설정
        config()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("HomeVC - viewDidAppear() called")
        self.searchBar.becomeFirstResponder() // 포커싱 주기
    }
    
    // 화면이 넘어가기 전에 준비한다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("HomeVC - prepare() called / segu.identifier : \(segue.identifier)")
        
        switch segue.identifier {
        case SEGUE_ID.USER_LIST_VC:
            //다음 화면의 뷰 컨트롤러를 가져온다.
            let nextVC = segue.destination as! UserListVC
        
            guard let userInputValue = self.searchBar.text else {return}
        
            nextVC.vcTitle = userInputValue + " 👩‍💻"
        case SEGUE_ID.PHOTO_COLLECTION_VC:
            //다음 화면의 뷰 컨트롤러를 가져온다.
            let nextVC = segue.destination as! PhotoCollectionVC
        
            guard let userInputValue = self.searchBar.text else {return}
        
            nextVC.vcTitle = userInputValue + " 👼🏻"
        default:
            print("default")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("HomeVC - viewWillAppear() called")
        //키보드 올라가는 이벤트를 받는 처리
        //키보드 노티 등록
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowHandle(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideHandle), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("HomeVC - viewWillDisappear() called")
        // 키보드 노티 해제
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    //MARK: - fileprivate methods
    fileprivate func config(){
        //ui설정
        self.searchButton.layer.cornerRadius = 10
        
        self.searchBar.searchBarStyle = .minimal
        //protocol delegate
        self.searchBar.delegate = self
        
        self.keyboardDismissTabGesture.delegate = self
        
        //제스처 추가하기
        self.view.addGestureRecognizer(keyboardDismissTabGesture)
        self.searchBar.becomeFirstResponder() //포커싱 추가
    }
    
    fileprivate func pushVC(){
        var segueId : String = ""
        
        switch searchFilterSegment.selectedSegmentIndex{
        case 0 :
            print("사진 화면으로 이동")
            segueId = "goToPhotoCollectionVC"
        case 1 :
            print("사용자 화면으로 이동")
            segueId = "goToUserListVC"
        default :
            print("default")
            segueId = "goToPhotoCollectionVC"
        }
        
        //화면 이동
        self.performSegue(withIdentifier: segueId, sender: self)
    }

    @objc func keyboardWillShowHandle(notification: NSNotification){
        print("HomeVC - keyboardWillShowHandle() called")
        //키보드 사이즈 가져오기
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?NSValue)?.cgRectValue{
            print("keyboardSize.height: \(keyboardSize.height)")
            print("searchButton.frame.origin.y : \(searchButton.frame.origin.y)")
            
            if(keyboardSize.height < searchButton.frame.origin.y){
                print("키보드가 버튼을 덮었다.")
                let distance = keyboardSize.height - searchButton.frame.origin.y
                print("이만큼 덮었다. distance: \(distance)")
                self.view.frame.origin.y -= searchButton.frame.height
            }
        }

//        self.view.frame.origin.y = -100
    }
    
    @objc func keyboardWillHideHandle(){
        print("HomeVC - keyboardWillHideHandle() called")
        self.view.frame.origin.y = 0
    }
    
    //MARK: - IBAction methods
    //검색 버튼이 클릭 되었을 때
    @IBAction func onSearchButtonClicked(_ sender: UIButton) {
        print("HomeVC - onSearchButtonClicked() called / selectedIndex : \(searchFilterSegment.selectedSegmentIndex)")
        
//        AF.request("https://api.unsplash.com/search/photos").response { response in
//            debugPrint(response)
//        }
        let url = API.BASE_URL + "search/photos"
        
        guard let userInput = self.searchBar.text else {return}
        //key, value 형식
        let queryParam = ["query": userInput,"client_id":API.CLIENT_ID]
//        AF.request(url,method: .get, parameters: queryParam).responseJSON(completionHandler: {response in debugPrint(response)})
        
        MyAlamofireManager
            .shared
            .session
            .request(url).responseJSON(completionHandler: {
                response in debugPrint(response)
            })
        //화면으로 이동
        pushVC()
    }
    
    
    @IBAction func seaarchFilterValueChanged(_ sender: UISegmentedControl) {
        //print("HomeVC - seaarchFilterValueChanged() called / inded : \(sender.selectedSegmentIndex)")
        
        var searchBarTitle = ""
        
        switch sender.selectedSegmentIndex {
            
        case 0 :
            searchBarTitle = "사진 키워드"
        case 1 :
            searchBarTitle = "사진 키워드"
        default :
            searchBarTitle = "사진 키워드"
        }
        
        self.searchBar.placeholder = searchBarTitle + " 입력"
        
       
        //self.searchBar.resignFirstResponder() // 포커싱 해제
        
        self.view.addGestureRecognizer(keyboardDismissTabGesture)
        
    }
    
    //MARK: - UISerachBar Delegate methods
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("HomeVC - searchBarSearchButtonClicked() called")
        
        guard let userInputString = searchBar.text else {return}
        
        if userInputString.isEmpty{
            // toast with a specific duration and position
            self.view.makeToast("📣 검색 키워드를 입력해주세요.", duration: 3.0, position: .center)
        }else {
            pushVC()
            searchBar.resignFirstResponder()
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("HomeVC - searchBar textDidChange() searchText :\(searchText)")
        
        //사용자가 입력한 값이 없을 때
        if(searchText.isEmpty){
            self.searchButton.isHidden = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: {
                //포커싱 해제
                searchBar.resignFirstResponder()
            })
        }else{
            self.searchButton.isHidden = false
        }
        
        if(searchText.count >= 12){
            // toast with a specific duration and position
            self.view.makeToast("📢 12자 까지만 입력 가능합니다.", duration: 3.0, position: .center)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let inputTextCount = searchBar.text?.appending(text).count ?? 0
        
        if(inputTextCount >= 12)
        {
            print("shouldChangeTextIn :\(searchBar.text?.appending(text).count)")
        }
        
//        if inputTextCount <= 12
//        {
//            return true
//        }else{
//            return false
//        }
        
        return inputTextCount <= 12
    }
    
    //MARK: - UIGestureRecognizerDelegate
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        //print("HomeVC - gestureRecognizer shouldReceive() called")
        
        //터치로 들어온 뷰가 searchFilterSegment이면
        if(touch.view?.isDescendant(of: searchFilterSegment) == true){
//            print("세그먼트가 터치되었다.")
            return false
        }else if(touch.view?.isDescendant(of: searchBar) == true){
//            print("서치바가 터치되었다.")
            return false
        }else{
            view.endEditing(true)
//            print("화면이 터치되었다.")
            return true
        }
    }
}


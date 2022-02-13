//
//  ViewController.swift
//  pagerView_tutorial
//
//  Created by 박은아 on 2022/02/13.
//

import UIKit
import FSPagerView

class ViewController: UIViewController, FSPagerViewDataSource, FSPagerViewDelegate {
    
    fileprivate let imageNames = ["1.png","2.png", "3.png","4.png"]
    
    @IBOutlet weak var leftBtn: UIButton!
    
    @IBOutlet weak var rightBtn: UIButton!
    
    @IBOutlet weak var myPagerView: FSPagerView! {
        didSet{
            // 페이저뷰에 썰을 등록한다.
            self.myPagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            // 아이템 크기 설정
            self.myPagerView.itemSize = FSPagerView.automaticSize
            //무한 스크롤 설정
            self.myPagerView.isInfinite = true
            //자동 스크롤
            self.myPagerView.automaticSlidingInterval = 4.0
        }
    }
    
    @IBOutlet weak var myPagerControl: FSPageControl!{
        didSet{
            self.myPagerControl.numberOfPages = self.imageNames.count
            self.myPagerControl.contentHorizontalAlignment = .right
            self.myPagerControl.itemSpacing = 16
            self.myPagerControl.interitemSpacing = 16
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.myPagerView.dataSource = self
        self.myPagerView.delegate = self
        
        self.leftBtn.layer.cornerRadius = self.leftBtn.frame.height / 2
        self.rightBtn.layer.cornerRadius = self.rightBtn.frame.height / 2
    }

    // MARK: IBActions
    @IBAction func onLeftBtnClicked(_ sender: UIButton) {
        print("ViewController - call onLeftBtnClicked()")
        self.myPagerControl.currentPage = self.myPagerControl.currentPage - 1
        self.myPagerView.scrollToItem(at: self.myPagerControl.currentPage, animated: true)
    }
    
    
    @IBAction func onRightBtnClicked(_ sender: UIButton) {
        print("ViewController - call onRightBtnClicked()")
        
        if(self.myPagerControl.currentPage == self.imageNames.count - 1)
        {
            self.myPagerControl.currentPage = 0
        } else {
            self.myPagerControl.currentPage = self.myPagerControl.currentPage + 1
        }
        
        self.myPagerView.scrollToItem(at: self.myPagerControl.currentPage, animated: true)
    }
    
    // MARK: - FSPagerView Datasource
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
    }
    
    // MARK: - 각 cell에 대한 설정
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        
            cell.imageView?.image = UIImage(named: self.imageNames[index])
            cell.imageView?.contentMode = .scaleAspectFit
            //cell.textLabel?.text = ...
            return cell
    }
    
    // MARK: - FSPagerView delegate
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.myPagerControl.currentPage = targetIndex
    }

    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.myPagerControl.currentPage = pagerView.currentIndex
    }

    func pagerView(_ pagerView: FSPagerView, shouldHighlightItemAt index: Int) -> Bool {
        return false
    }
}


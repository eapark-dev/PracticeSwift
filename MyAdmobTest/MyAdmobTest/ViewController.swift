//
//  ViewController.swift
//  MyAdmobTest
//
//  Created by 박은아 on 2022/01/31.
//
import GoogleMobileAds
import UIKit

class ViewController: UIViewController,GADBannerViewDelegate {

    var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // In this case, we instantiate the banner with desired ad size.
        
        // In this case, we instantiate the banner with desired ad size.
        //배너의 사이즈를 설정
        bannerView = GADBannerView(adSize: kGADAdSizeMediumRectangle)
        
        // 광고 배너의 아이디를 설정
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        
        // 광고를 로드한다.
        bannerView.load(GADRequest())
        
        //델리겟을 배너뷰에 연결
        bannerView.delegate = self
    }
    
    //화면에 배너뷰를 추가
    func addBannerViewToView(_ bannerView: GADBannerView) {
        //오토레이아웃으로 뷰를 설정
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        //루트뷰에 배너를 추가한다.
        view.addSubview(bannerView)
        //추가 배너의 위치를 설정하는 부분
        view.addConstraints(
          [NSLayoutConstraint(item: bannerView,
                              attribute: .bottom,
                              relatedBy: .equal,
                              toItem: bottomLayoutGuide,
                              attribute: .top,
                              multiplier: 1,
                              constant: 0),
           NSLayoutConstraint(item: bannerView,
                              attribute: .centerX,
                              relatedBy: .equal,
                              toItem: view,
                              attribute: .centerX,
                              multiplier: 1,
                              constant: 0)
          ])
       }
    
    //MARK: - GADBannerViewDelegate
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
      print("bannerViewDidReceiveAd")
        //화면에 배너뷰를 추가
        addBannerViewToView(bannerView)
    }

    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
      print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
      print("bannerViewDidRecordImpression")
    }

    func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillPresentScreen")
    }

    func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillDIsmissScreen")
    }

    func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewDidDismissScreen")
    }
}


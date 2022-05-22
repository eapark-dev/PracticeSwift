//
//  DetailViewController.swift
//  MovieApp
//
//  Created by 박은아 on 2022/05/20.
//

import UIKit
import AVKit

class DetailViewController: UIViewController {

    
    var movieResult: MovieResult?
    var player: AVPlayer?
    @IBOutlet weak var movieContainer: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!{
        didSet{
            titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        }
    }
    
    @IBOutlet weak var descriptionLabel: UILabel!{
        didSet{
            descriptionLabel.font = UIFont.systemFont(ofSize: 16,weight: .light)
        }
    }
    
    //메모리에 준비되서 나온 상태
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = movieResult?.trackName
        descriptionLabel.text = movieResult?.longDescription

        // Do any additional setup after loading the view.
    }
    
    
    //나오는 순간
//    override func viewWillAppear(_ animated: Bool) {
//        <#code#>
//    }

    //다 나온 상태 (디바이스의 크기값이나 위치값을 가져오는 순간에 실행)
    override func viewDidAppear(_ animated: Bool) {
        
        if let hasUrl = movieResult?.previewUrl {
            makePlayerAndPlay(urlString: hasUrl)
        }
    }
    
    func makePlayerAndPlay(urlString: String){
        if let hasUrl = URL(string: urlString){
            self.player = AVPlayer(url: hasUrl)
            let playerLayer = AVPlayerLayer(player: player)
            
            movieContainer.layer.addSublayer(playerLayer)
            
            playerLayer.frame = movieContainer.bounds
            
            self.player?.play()
        }
    }
    
    @IBAction func play(_ sender: Any) {
        self.player?.play()
    }
    
    
    @IBAction func stop(_ sender: Any) {
        self.player?.pause()
    }
    
    @IBAction func close(_ sender: Any) {
        //dismiss => present한 걸 내릴 때
        self.dismiss(animated: true, completion: nil)
    }
    /*

     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  MovieApp
//
//  Created by 박은아 on 2022/05/15.
//

import UIKit


class ViewController: UIViewController {
    
    var movieModel: MovieModel?

    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var term = ""
    var api = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //delegate를 연결해야 데이터를 전달받을 수 있음.
        movieTableView.delegate = self
        movieTableView.dataSource = self
        searchBar.delegate = self
        
        requestMovieApi()
    }

    //api 따로 빼서 사용했을 때
    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void){
        api.request(type: .Url(urlString: urlString)) { data, response, error in
            
            if let hasData = data {
                completion(UIImage(data: hasData))
                return
            }
            
            completion(nil)
        }
    }
    
    func requestMovieApi(){
        
        let term = URLQueryItem(name:"term",value: term)
        let media = URLQueryItem(name:"media",value: "movie")
        let country = URLQueryItem(name:"country",value: "KR")
        
        let querys = [term, media, country]
        
        api.request(type: .search(querys: querys)) { data, response, error in
            if let hasData = data{
                do{
                    self.movieModel =  try JSONDecoder().decode(MovieModel.self, from: hasData)
                    //다시 불러온다.
                    //메인 스레드에서 불러와야함
                    DispatchQueue.main.async {
                        self.movieTableView.reloadData()
                    }
                }catch{
                    print(error)
                }
                
            }
        }
    }
}
    
//한곳에서 불러온 api
    
    //네트워크 주소로 url 가져오기
//    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void){
//        let sessionConfig = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfig)
//
//        if let hasURL = URL(string: urlString) {
//            var request = URLRequest(url: hasURL)
//            request.httpMethod = "GET"
//
//            session.dataTask(with: request){ data, response, error in
//               //print((response as! HTTPURLResponse).statusCode)
//
//                if let hasData = data {
//                    completion(UIImage(data: hasData))
//                    return
//                }
//            }.resume()
//            session.finishTasksAndInvalidate()
//        }
//
//        completion(nil)
//
//    }

    // api 통신 방법
//    func requestMovieApi(){
//        let sessionConfig = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfig)
//
//        var components = URLComponents(string: "https://itunes.apple.com/search")
//
//        let term = URLQueryItem(name:"term",value: "marvel")
//        let media = URLQueryItem(name:"media",value: "movie")
//        let country = URLQueryItem(name:"country",value: "KR")
//
//        components?.queryItems = [term,media,country]
//
//        //quard옵션 : url을 가져올 수 없으면 끝낸다.
//        guard let url = components?.url else {
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        let task = session.dataTask(with: request){ data, response, error in
//          // print((response as! HTTPURLResponse).statusCode)
//
//            if let hasData = data{
//                do{
//                    self.movieModel =  try JSONDecoder().decode(MovieModel.self, from: hasData)
//                    print(self.movieModel ?? "no data")
//                    //다시 불러온다.
//                    //메인 스레드에서 불러와야함
//                    DispatchQueue.main.async {
//                        self.movieTableView.reloadData()
//                    }
//                }catch{
//                    print(error)
//                }
//
//            }
//        }
//
//        task.resume()
//        session.finishTasksAndInvalidate()
//
//    }
//}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieModel?.results.count ?? 0
    }
    
    //테이블 셀을 선택했을 때 ->클릭 이벤트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        
        detailVC.movieResult = self.movieModel?.results[indexPath.row]
        
        //화면 꽉차게 하는 경우 사용 (이럴땐 꼭 버튼으로 닫기 추가해야함)
        //detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true){

        }
    }
    
    //사이즈 규격화
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"MovieCell", for: indexPath) as! MovieCell
        cell.titleLabel.text = self.movieModel?.results[indexPath.row].trackName
        cell.descriptionLabel.text = self.movieModel?.results[indexPath.row].longDescription
        
        let currency = self.movieModel?.results[indexPath.row].currency ?? ""
        let price = self.movieModel?.results[indexPath.row].trackPrice ?? 0
        
        cell.priceLabel.text =  currency + " " + String(price)
        
        if let hasURL = self.movieModel?.results[indexPath.row].image{
            self.loadImage(urlString: hasURL){ image in
                DispatchQueue.main.async {
                cell.movieImageView.image = image
                }
                
            }
        }
        
        //iOS8601DateFormat - 기본 포맷
        if let dateString = self.movieModel?.results[indexPath.row].releaseDate {
            let formatter = ISO8601DateFormatter()
            if let isoDate = formatter.date(from: dateString) {
                
                let myFormatter = DateFormatter()
                myFormatter.dateFormat = "yyyy-MM-dd"
                let dateString = myFormatter.string(from: isoDate)
                
                cell.dateLabel.text = dateString
            }
        }
        

        
        return cell
    }
    
    
}

extension ViewController:UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let hasText = searchBar.text else{
            return
        }
        term = hasText
        
        requestMovieApi()
        //키보드 내리기
        self.view.endEditing(true)
    }
}


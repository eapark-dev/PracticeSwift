//
//  ViewController.swift
//  sentiTable
//
//  Created by 박은아 on 2022/01/17.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    var newsData : Array<Dictionary<String, Any>>?
    
    //1. http 통신 방법 -- url session
    //2. JSON 데이터 형태
    //3. 테이블뷰의 데이터 매칭! <- 통보, 그리기
    //background : network
    
    func getNews(){
        let task = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/top-headlines?country=kr&category=business&apiKey=79d6e4fd785349419093bb946edf954f")!) { (data,response, error) in
            if let dataJson = data {
 
                //json parsing
                do{
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any> //형태가 뭔 지 모를 때 사용함 Any
                    
                    let articles = json["articles"] as! Array<Dictionary<String, Any>>
                    self.newsData = articles
                    
                    DispatchQueue.main.async {
                        self.TableViewMain.reloadData() // Main
                    } //main에서 일을 해라
                    
      
                }
                catch{}
            }
        }
        
        task.resume()
    }
    
    
    //2. 데이터 몇 개 인지?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //숫자로 반환
        
        if let news = newsData{
            return news.count
        }else {
            return 0
        }
        
    }
    
    //1. 데이터 무엇인 지?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1.임의의 Cell 방식으로 만드는 테이블 뷰
        //let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
        //let cell = UITableViewCell.init(style: .default, reuseIdentifier: "Type1")
        //tableView에서 받아온 행에 숫자
        //as ?가 붙거나 ! 붙거나
        //부모 자식 친자 확인
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        //cell.textLabel?.text = "\(indexPath.row)"
        
        let idx = indexPath.row
        if let news = newsData {
            
            let row = news[idx]
            if let r = row as? Dictionary<String, Any>{
                if let title = r["title"] as? String{
                    cell.LabelText.text = title
                }
            }
           
        }
        
        return cell
    }
    //1. 클릭 감지
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "NewsDetailController") as! NewsDetailController
        
        if let news = newsData {
            let row = news[indexPath.row]
            if let r = row as? Dictionary<String, Any>{
                
                if let imageUrl = r["urlToImage"] as? String{
                    controller.imageUrl = imageUrl
                }
                
                if let desc = r["description"] as? String{
                    controller.desc = desc
                }
            }
        }
        
        //이동 - 수동
        //showDetailViewController(controller, sender: nil)
    }
    
    //2. 세그웨이 : 부모(가나다) - 자식(가나다)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, "NewsDetail" == id{
            if let controller = segue.destination as? NewsDetailController {
                
                if let news = newsData {
                    if let indexPath = TableViewMain.indexPathForSelectedRow
                    {
                        let row = news[indexPath.row]
                        if let r = row as? Dictionary<String, Any>{
                            
                            if let imageUrl = r["urlToImage"] as? String{
                                controller.imageUrl = imageUrl
                            }
                            
                            if let desc = r["description"] as? String{
                                controller.desc = desc
                            }
                        }
                    }
                    
                    
                }
            }
        }
        
        //이동 - 자동
    }
    
    //1. 디테일 (상세) 화면 만들기
    //2. 값을 보내기
    //1. tableview delegate / 2. storyboard (segue)
    //3. 화면 이동 (이동하기 전에 값을 미리 세팅해야 함)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self => 클래스 안에 function을 의미함
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        
        getNews()
    }

    //tableview 테이블로 된 뷰 - 여러개의 행이 모여있는 목록 뷰(화면)
    //정갈하게 보여짐
    
    //1. 데이터 무엇인 지 -- 전화번호 부 일 경우
    //2. 데이터가 몇개 인 지 -- 100, 1000, 10000
    //3. (옵션)데이터 행 눌렀다 -- 클릭
    
    
}


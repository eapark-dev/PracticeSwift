//
//  ViewController.swift
//  sentiTable
//
//  Created by 박은아 on 2022/01/17.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    //1. http 통신 방법 -- url session
    //2. JSON 데이터 형태
    
    func getNews(){
        let task = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=79d6e4fd785349419093bb946edf954f")!) { (data,response, error) in
            if let dataJson = data {
 
                //json parsing
                do{
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: [])
                    print(json)
                }
                catch{}
            }
        }
        
        task.resume()
    }
    
    
    //2. 데이터 몇 개 인지?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //숫자로 반환
        return 10
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
        cell.LabelText.text = "\(indexPath.row)"
        return cell
    }
    //클릭 이벤트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }

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


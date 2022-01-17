//
//  ViewController.swift
//  sentiTable
//
//  Created by 박은아 on 2022/01/17.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var TableViewMain: UITableView!
    //2. 데이터 몇 개 인지?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //숫자로 반환
        return 10
    }
    
    //1. 데이터 무엇인 지?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1.임의의 Cell 방식으로 만드는 테이블 뷰
        //let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "Type1")
        //tableView에서 받아온 행에 숫자
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self => 클래스 안에 function을 의미함
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
    }

    //tableview 테이블로 된 뷰 - 여러개의 행이 모여있는 목록 뷰(화면)
    //정갈하게 보여짐
    
    //1. 데이터 무엇인 지 -- 전화번호 부 일 경우
    //2. 데이터가 몇개 인 지 -- 100, 1000, 10000
    //3. (옵션)데이터 행 눌렀다 -- 클릭
    
    
}


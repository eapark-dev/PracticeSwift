//
//  ViewController.swift
//  MovieApp
//
//  Created by 박은아 on 2022/05/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //delegate를 연결해야 데이터를 전달받을 수 있음.
        movieTableView.delegate = self
        movieTableView.dataSource = self
        searchBar.delegate = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"MovieCell", for: indexPath) as! MovieCell
        
        return cell
    }
    
    
}

extension ViewController:UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

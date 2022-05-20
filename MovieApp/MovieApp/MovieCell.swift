//
//  MovieCell.swift
//  MovieApp
//
//  Created by 박은아 on 2022/05/15.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet{
            titleLabel.font = UIFont.systemFont(ofSize: 18, weight:  .medium)
        }
    }
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel!{
        didSet{
            descriptionLabel.font = UIFont.systemFont(ofSize: 10, weight: .light)
        }
    }
    @IBOutlet weak var priceLabel: UILabel! {
        didSet{
            priceLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        }
    }
    @IBOutlet weak var movieImageView: UIImageView!
}

//
//  MovieModel.swift
//  MovieApp
//
//  Created by 박은아 on 2022/05/19.
//

import Foundation

struct MovieModel: Codable {
    let resultCount : Int
    let results: [Result]
}

struct Result: Codable {
    let trackName: String?
    let previewUrl: String?
    let image: String?
    let shortDescription: String?
    let longDescription: String?
    let currency: String?
    let trackPrice: Int?
    
    enum CodingKeys: String, CodingKey{
        case trackName
        case previewUrl
        case image = "artworkUrl100"
        case shortDescription
        case longDescription
        case currency
        case trackPrice
    }
}

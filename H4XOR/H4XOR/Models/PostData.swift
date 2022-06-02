//
//  PostData.swift
//  H4XOR
//
//  Created by 박은아 on 2022/06/01.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}



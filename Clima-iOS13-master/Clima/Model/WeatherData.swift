//
//  WeatherData.swift
//  Clima
//
//  Created by 박은아 on 2022/04/20.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData : Codable{ //Codable = Encodable + Decodable
    let name : String
    let main : Main
    let weather : [Weather]
}

struct Main : Codable {
    let temp : Double
}

struct Weather :Codable  {
    let description : String
    let id : Int
}

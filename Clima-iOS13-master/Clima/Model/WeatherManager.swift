//
//  WeatherManager.swift
//  Clima
//
//  Created by 박은아 on 2022/04/19.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=4dd0299c7c6c699320733a04ae7d68ec&units=metric"

    func fetchWeather(cityName : String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString : String){
        //1. URL 만들기
        
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            
            //completionHandler :
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error: ))
            
            //4. Start the task
            task.resume()
            
        }
    }
    
    
    //Closures 함수 : 본질적으로 익명의 함수 또는 이름이 없는 함수를 의미, 독립적
    func handle(data:Data?, response : URLResponse?, error:Error?){
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data:safeData, encoding: .utf8)
            print(dataString)
        }
    }

}

//
//  API.swift
//  MovieApp
//
//  Created by 박은아 on 2022/05/22.
//

import Foundation

//type 분류
enum MovieAPIType{
    case Url(urlString:String)
    case search(querys: [URLQueryItem])
}

enum MovieAPIError: Error{
    case bedURL
}

class API{
    // url
    // url + param
    //closure 기본 형식 ()-> Void
    
    //type이름 정의
    typealias NewtworkCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error? )-> Void
    
    //@escaping: 데이터가 날라가지 않도록 사용
    func request(type: MovieAPIType, completion: @escaping NewtworkCompletion ){
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        do{
            let request = try buildRequest(type: type)
            
            session.dataTask(with: request){ data, response, error in
               //print((response as! HTTPURLResponse).statusCode)
                completion(data,response,error)
                
            }.resume()
            session.finishTasksAndInvalidate()
            
        }catch{ //exception처리
            print(error)
        }
        
    }
    
    private func buildRequest(type: MovieAPIType) throws -> URLRequest{
        
        switch type {
        case .Url(urlString: let urlString):
            //guard : 가져오지 못했을 때 throws에 대한 값
            guard let hasURL = URL(string: urlString) else{
                throw MovieAPIError.bedURL
            }
            
            var request = URLRequest(url: hasURL)
            request.httpMethod = "GET"
            return request
            
        case .search(querys: let querys):
            var components = URLComponents(string: "https://itunes.apple.com/search")
            components?.queryItems = querys
            
            //quard옵션 : url을 가져올 수 없으면 끝낸다.
            guard let hasUrl = components?.url else{
                throw MovieAPIError.bedURL
            }
            
            var request = URLRequest(url: hasUrl)
            request.httpMethod = "GET"
            return request
        }
        
    }
}
    


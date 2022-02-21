//
//  MySearch.swift
//  Fundamental_tutorial
//
//  Created by 박은아 on 2022/02/21.
//

import Foundation
import Alamofire

//검색 관련 API 호출
enum MySearchRouter: URLRequestConvertible {
    
    case searchPhotos(term: String)
    case searchUsers(term: String)
    
    var baseURL: URL {
        return URL(string: API.BASE_URL + "search/")!
    }
    
    var method: HTTPMethod {
//        return .get
        
        switch self {
        case .searchPhotos, .searchUsers:
            return .get
        }
        
//        switch self {
//        case .searchPhotos:
//            return .get
//        case .searchUsers:
//            return .post
//        }
    }
    
    var endPoint: String {
        switch self {
        case .searchPhotos:
            return "photos/"
        case .searchUsers:
            return "users/"
        }
    }
    
    var parameters : [String: String] {
        //
        //        switch selft {
        //        case let .searchUsers(term):
        //            return ["query1" : term + ""]
        //        case let .searchPhotos(term):
        //            return ["query2" : term]
        //        }
        //
        
        switch self {
        case let .searchUsers(term), let .searchPhotos(term):
            return ["query" : term]
        }
        
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = baseURL.appendingPathComponent(endPoint)
        
        print("MySearchRouter - asURLRequest() called url : \(url)")
        
        var request = URLRequest(url: url)
        
        request.method = method
        
        request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
//        switch self {
//        case let .get(parameters):
//            request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
//        case let .post(parameters):
//            request = try JSONParameterEncoder().encode(parameters, into: request)
//        }
        
        return request
    }

}

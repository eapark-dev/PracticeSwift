//
//  BaseIntercetor.swift
//  Fundamental_tutorial
//
//  Created by 박은아 on 2022/02/20.
//

import Foundation
import Alamofire

class BaseInterceptor : RequestInterceptor{
    
    //request 호출 될 때 사용
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        print("BaseIntercetor - adapt() called")
        
        var request = urlRequest
        //header 세팅
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Accept")
        
        
        //공통 파라미터 추가
//        var dictionary = [String:String]()
//
//        dictionary.updateValue(API.CLIENT_ID, forKey: "client_id")
//
//        do{
//            request = try URLEncodedFormParameterEncoder().encode(dictionary, into: request)
//        }catch{
//            print(error)
//        }
    
        completion(.success(request))
    }
    
    //응답에 대한 결과
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        print("BaseIntercetor - retry() called")
        
        guard let statusCode = request.response?.statusCode else {
            completion(.doNotRetry)
            return
        }
        
        let data = ["statusCode" : statusCode]
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: NOTIFICATION.API
                                                                    .AUTH_FAIL), object: nil, userInfo: data)
        completion(.doNotRetry)
    }
}

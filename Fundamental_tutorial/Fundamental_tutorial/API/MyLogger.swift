//
//  MyLogger.swift
//  Fundamental_tutorial
//
//  Created by 박은아 on 2022/02/20.
//

import Foundation
import Alamofire

final class MyLogger : EventMonitor {
    
    let queue = DispatchQueue(label : "ApiLog")
    
    func requestDidResume(_ request: Request) {
        print("MyLogger - requestDidResume() called")
        debugPrint(request)
    }
    
    func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {
        print("MyLogger - request.didParseResponse() called")
        debugPrint(response)
    }
}

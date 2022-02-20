//
//  MyApiStatusLogger.swift
//  Fundamental_tutorial
//
//  Created by 박은아 on 2022/02/20.
//

import Foundation
import Alamofire

final class MyApiStatusLogger : EventMonitor {
    
    let queue = DispatchQueue(label : "MyApiStatusLogger")

//    func requestDidResume(_ request: Request) {
//        print("MyApiStatusLogger - requestDidResume() called")
//        debugPrint(request)
//    }
    
    func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {

        guard let statusCode = request.response?.statusCode else {return}
        
        print("MyApiStatusLogger - request() called")
//        debugPrint(response)
    }
}

//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by 박은아 on 2022/03/31.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let text : String
    let answer : String
    
    //초기화
    init(q:String,a:String){
        text = q
        answer = a
    }
}

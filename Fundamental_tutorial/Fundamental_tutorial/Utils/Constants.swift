//
//  Constants.swift
//  Fundamental_tutorial
//
//  Created by 박은아 on 2022/02/18.
//

import Foundation

enum SEGUE_ID {
    static let USER_LIST_VC = "goToUserListVC"
    static let PHOTO_COLLECTION_VC = "goToPhotoCollectionVC"
}

enum API {
    
    static let BASE_URL : String = "https://api.unsplash.com/"
    //사이트에서 발급받은 api 키
    static let CLIENT_ID : String = "4Q8XJ_SUYc44u4ks7SQ_i2xGlUe2GMwrqVhmaiKZ2jc"
    
}

enum NOTIFICATION {
    enum API {
        static let AUTH_FAIL = "authentication_fail"
    }
}

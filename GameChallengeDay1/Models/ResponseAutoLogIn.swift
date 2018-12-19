//
//  ResponseAutoLogIn.swift
//  GameChallengeDay1
//
//  Created by z on 2018/12/18.
//  Copyright © 2018年 z. All rights reserved.
//

import Foundation
struct ResponseAutoLogIn: Decodable {
    
    var result: String
    var data: UserInfo?
    var message: Message?
    
    
    struct UserInfo: Decodable {
        
        var name: String
        var balance: Int?
        var api_token: String?
        
    }
    
    struct Message: Decodable {
        
        var api_token: [String]
    }
}

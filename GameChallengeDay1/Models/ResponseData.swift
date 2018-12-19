//
//  ResponseData.swift
//  GameChallengeDay1
//
//  Created by z on 2018/12/18.
//  Copyright © 2018年 z. All rights reserved.
//

import Foundation

struct ResponseData: Decodable {
    
    var result: String
    var data: UserInfo?
    var message: String?




    struct UserInfo: Decodable {

        var name: String?
        var balance: Int?
        var api_token: String?
        
    }
    
    
}

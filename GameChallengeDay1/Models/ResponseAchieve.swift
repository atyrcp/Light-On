//
//  ResponseAchieve.swift
//  GameChallengeDay1
//
//  Created by z on 2018/12/19.
//  Copyright © 2018年 z. All rights reserved.
//

import Foundation
struct ResponseAchieve: Decodable {
    
    var result: String
    var data: [UserInfo]
    
    
    struct UserInfo: Decodable {
        
        var id: Int
        var user_id: Int
        var achieve_id: Int
        var created_at: String
        var updated_at: String
    }
}

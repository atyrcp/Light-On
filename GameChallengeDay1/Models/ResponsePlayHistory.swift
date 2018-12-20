//
//  ResponsePlayHistory.swift
//  GameChallengeDay1
//
//  Created by z on 2018/12/19.
//  Copyright © 2018年 z. All rights reserved.
//

import Foundation
struct ResponsePlayHistory: Decodable {
    
    var result: String
    var data: [UserInfo]
    
    struct UserInfo: Decodable {
        
        var user_id: Int
        var game_id: Int
        var amount: Int
        var description: String
        var updated_at: String
    }
}

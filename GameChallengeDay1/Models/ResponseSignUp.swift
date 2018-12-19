//
//  ResponseSignUp.swift
//  GameChallengeDay1
//
//  Created by z on 2018/12/18.
//  Copyright © 2018年 z. All rights reserved.
//

import Foundation
struct ResponseSignUp: Decodable {
    
    var result: String
    var data: String?
    var message: Message?
    
    struct Message: Decodable {
        var email: [String]
    }

    
    
}

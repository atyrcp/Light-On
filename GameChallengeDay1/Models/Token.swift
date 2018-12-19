//
//  Token.swift
//  GameChallengeDay1
//
//  Created by z on 2018/12/18.
//  Copyright © 2018年 z. All rights reserved.
//

import Foundation

struct Token: Codable {
    
    var api_token: String
    
    init(token: String) {
        self.api_token = token
    }
}

//
//  SaveAchieve.swift
//  GameChallengeDay1
//
//  Created by z on 2018/12/19.
//  Copyright © 2018年 z. All rights reserved.
//

import Foundation
struct SaveAchieve: Codable {
    
    var api_token: String
    var achieve_id: String
    
    init(token: String, id: String) {
        self.api_token = token
        self.achieve_id = id
    }
}


//
//  PurchaseItem.swift
//  GameChallengeDay1
//
//  Created by z on 2018/12/19.
//  Copyright © 2018年 z. All rights reserved.
//

import Foundation

struct PurchaseItem: Codable {
    
    var game_id = 3
    var item_id: Int
    var cost = 100
    var api_token: String
    
    init(id: Int, token: String) {
        self.item_id = id
        self.api_token = token
    }
    
}

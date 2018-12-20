//
//  ResponseShop.swift
//  GameChallengeDay1
//
//  Created by z on 2018/12/19.
//  Copyright © 2018年 z. All rights reserved.
//

import Foundation
struct ResponseShop: Decodable {
    
    var result: String
    var data: [ShopInfo]
    
    struct ShopInfo: Decodable {
        
//        var game_id: Int
        var item_id: Int
    }
}

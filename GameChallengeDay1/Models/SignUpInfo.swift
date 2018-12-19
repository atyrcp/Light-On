//
//  SignUpInfo.swift
//  GameChallengeDay1
//
//  Created by z on 2018/12/18.
//  Copyright © 2018年 z. All rights reserved.
//

import Foundation

struct SignUpInfo: Codable {
    
    var name: String
    var email: String
    var password: String
    var password_confirmation: String
    
    init(name: String, email: String, password: String, password_confirmation: String) {
        self.name = name
        self.email = email
        self.password = password
        self.password_confirmation = password_confirmation
    }
}

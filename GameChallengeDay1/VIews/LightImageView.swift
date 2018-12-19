//
//  LightImageView.swift
//  GameChallengeDay1
//
//  Created by z on 2018/12/17.
//  Copyright © 2018年 z. All rights reserved.
//

import UIKit

class LightImageView: UIImageView {

    
    var isOn = false {
        didSet {
            if isOn {
                self.image = UIImage(named: "candle")
            } else {
                self.image = UIImage(named: "fff")
            }
        }
    }
    
    override func awakeFromNib() {
        self.image = UIImage(named: "fff")
        self.backgroundColor = .clear
    }

}

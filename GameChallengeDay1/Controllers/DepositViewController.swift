//
//  DepositViewController.swift
//  GameChallengeDay1
//
//  Created by z on 2018/12/17.
//  Copyright © 2018年 z. All rights reserved.
//

import UIKit

class DepositViewController: UIViewController {
    
    @IBOutlet weak var item1ImageView: UIImageView!
    @IBOutlet weak var item2ImageView: UIImageView!
    @IBOutlet weak var item3ImageView: UIImageView!
    @IBOutlet weak var item4ImageView: UIImageView!
    @IBOutlet weak var item5ImageView: UIImageView!
    @IBOutlet weak var item6ImageView: UIImageView!
    @IBOutlet weak var item7ImageVIew: UIImageView!
    @IBOutlet weak var item8ImageView: UIImageView!
    @IBOutlet weak var item9ImageView: UIImageView!
    
    @IBOutlet weak var coinLeftLabel: UILabel!
    
    
    @IBOutlet var chooseButtonCollection: [UIButton]!
    @IBOutlet var buyButtonCollection: [UIButton]!
    @IBOutlet var itemImageViewCollection: [UIImageView]!
    
    
    
    
    var itemsToPurchase = [UIImage(named: "item1"),UIImage(named: "item2"),UIImage(named: "item3"),UIImage(named: "item4"),UIImage(named: "item5"),UIImage(named: "item6"),UIImage(named: "item7"),UIImage(named: "item8"),UIImage(named: "item9")]
    
    var coin = 0
    var ownedList = [Int]()
    
    @IBAction func purchaseItem(_ sender: UIButton) {
        
        APIrequest.shared.purchaseItem(UserDefaults.standard.string(forKey: "api_token")!, sender.tag) { (response) in
            if response.result == "success" {
                DispatchQueue.main.async {
                    sender.setOwned()
                    
                    self.coin = (response.data?.balance)!
                    self.coinLeftLabel.text = "\(self.coin)p left"
                    for button in self.chooseButtonCollection {
                        if button.tag == sender.tag {
                            button.isEnabled = true
                        }
                    }
                }
            }
        }
    }
    
    
    @IBAction func chooseTheme(_ sender: UIButton) {
        
        for button in chooseButtonCollection {
            if button.tag == sender.tag {
                button.setTheme(is: true)
            } else {
                button.setTheme(is: false)
            }
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController {
            vc.coin = self.coin
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        
        self.ownedList = [Int]()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let token = UserDefaults.standard.string(forKey: "api_token")
        APIrequest.shared.getBalance(token!) { (response) in
            DispatchQueue.main.async {
                self.coin = (response.data?.balance)!
                self.coinLeftLabel.text = "\(self.coin)p left"
            }
        }
        
        for items in ownedList {
            switch items {
            case 1:
                for button in buyButtonCollection {
                    if button.tag == 1 {
                        button.setOwned()
                    }
                }
                for button in chooseButtonCollection {
                    if button.tag == 1 {
                        DispatchQueue.main.async {
                            button.isEnabled = true
                        }
                    }
                }
            case 2:
                for button in buyButtonCollection {
                    if button.tag == 2 {
                        button.setOwned()
                    }
                }
                for button in chooseButtonCollection {
                    if button.tag == 2 {
                        DispatchQueue.main.async {
                            button.isEnabled = true
                        }
                    }
                }
            case 3:
                for button in buyButtonCollection {
                    if button.tag == 3 {
                        button.setOwned()
                    }
                }
                for button in chooseButtonCollection {
                    if button.tag == 3 {
                        DispatchQueue.main.async {
                            button.isEnabled = true
                        }
                    }
                }
            case 4:
                for button in buyButtonCollection {
                    if button.tag == 4 {
                        button.setOwned()
                    }
                }
                for button in chooseButtonCollection {
                    if button.tag == 4 {
                        DispatchQueue.main.async {
                            button.isEnabled = true
                        }
                    }
                }
            case 5:
                for button in buyButtonCollection {
                    if button.tag == 5 {
                        button.setOwned()
                    }
                }
                for button in chooseButtonCollection {
                    if button.tag == 5 {
                        DispatchQueue.main.async {
                            button.isEnabled = true
                        }
                    }
                }
            case 6:
                for button in buyButtonCollection {
                    if button.tag == 6 {
                        button.setOwned()
                    }
                }
                for button in chooseButtonCollection {
                    if button.tag == 6 {
                        DispatchQueue.main.async {
                            button.isEnabled = true
                        }
                    }
                }
            case 7:
                for button in buyButtonCollection {
                    if button.tag == 7 {
                        button.setOwned()
                    }
                }
                for button in chooseButtonCollection {
                    if button.tag == 7 {
                        DispatchQueue.main.async {
                            button.isEnabled = true
                        }
                    }
                }
            case 8:
                for button in buyButtonCollection {
                    if button.tag == 8 {
                        button.setOwned()
                    }
                }
                for button in chooseButtonCollection {
                    if button.tag == 8 {
                        DispatchQueue.main.async {
                            button.isEnabled = true
                        }
                    }
                }
            case 9:
                for button in buyButtonCollection {
                    if button.tag == 9 {
                        button.setOwned()
                    }
                }
                for button in chooseButtonCollection {
                    if button.tag == 9 {
                        DispatchQueue.main.async {
                            button.isEnabled = true
                        }
                    }
                }
            default:
                break
            }
        }
        
        
        coinLeftLabel.text = "\(coin)p left"
        
        chooseButtonCollection.forEach(){ $0.isEnabled = false }
        item1ImageView.image = UIImage(named: "item1")
        item2ImageView.image = UIImage(named: "item2")
        item3ImageView.image = UIImage(named: "item3")
        item4ImageView.image = UIImage(named: "item4")
        item5ImageView.image = UIImage(named: "item5")
        item6ImageView.image = UIImage(named: "item6")
        item7ImageVIew.image = UIImage(named: "item7")
        item8ImageView.image = UIImage(named: "item8")
        item9ImageView.image = UIImage(named: "item9")
        
    }

}




extension UIButton {
    
    func setOwned() {
        self.setTitle("✔︎", for: .normal)
        self.isEnabled = false
        self.backgroundColor = UIColor.darkGray
        
    }
    
    func setTheme(is set: Bool) {
        if set {
            self.setTitle("In Use", for: .normal)
            self.setTitleColor(#colorLiteral(red: 0.7619566942, green: 0.2510780796, blue: 0.1470434638, alpha: 1), for: .normal)
            self.backgroundColor = UIColor.darkGray
            switch tag {
            case 1:
                UserDefaults.standard.set("item1", forKey: "item")
            case 2:
                UserDefaults.standard.set("item2", forKey: "item")
            case 3:
                UserDefaults.standard.set("item3", forKey: "item")
            case 4:
                UserDefaults.standard.set("item4", forKey: "item")
            case 5:
                UserDefaults.standard.set("item5", forKey: "item")
            case 6:
                UserDefaults.standard.set("item6", forKey: "item")
            case 7:
                UserDefaults.standard.set("item7", forKey: "item")
            case 8:
                UserDefaults.standard.set("item8", forKey: "item")
            case 9:
                UserDefaults.standard.set("item9", forKey: "item")
            default:
                break
            }
        } else {
            self.setTitle("Choose", for: .normal)
            self.setTitleColor(#colorLiteral(red: 0.7619566942, green: 0.2510780796, blue: 0.1470434638, alpha: 1), for: .normal)
            self.backgroundColor = UIColor.black
        }
    }
}

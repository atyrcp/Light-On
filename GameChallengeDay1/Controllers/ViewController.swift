//
//  ViewController.swift
//  GameChallengeDay1
//
//  Created by z on 2018/12/17.
//  Copyright © 2018年 z. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var coinLeftLabel: UILabel!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var confirmLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var shopButton: UIButton!
    
    
    
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    var coin = 0 {
        didSet {
            DispatchQueue.main.async {
                self.coinLeftLabel.text = "\(self.coin)p left"
            }
        }
    }
    
    var achieveCount = 0
    var ownedList = [Int]()

    @IBAction func signUp(_ sender: UIButton) {
        if (nameTextField.text != nil) && (accountTextField.text != nil) && (passwordTextField.text != nil) && (confirmTextField.text != nil) && (passwordTextField.text == confirmTextField.text) {
            
            print("inside signup")
            APIrequest.shared.signUp(nameTextField.text!, accountTextField.text!, passwordTextField.text!, confirmTextField.text!) { (response) in
                if response.result == "success" {
                    DispatchQueue.main.async {
                        self.messageLabel.text = "welcom, please login"
                        UIView.animate(withDuration: 2, animations: {
                            self.messageLabel.alpha = 1
                        }, completion: { (_) in
                            UIView.animate(withDuration: 2, animations: {
                                self.messageLabel.alpha = 0
                            })
                        })
                    }
                    
                } else if response.result == "fail" {
                    DispatchQueue.main.async {
                        self.messageLabel.text = response.message?.email.first!
                        self.view.bringSubviewToFront(self.messageLabel)
                        UIView.animate(withDuration: 2, animations: {
                            self.messageLabel.alpha = 1
                        }, completion: { (_) in
                            UIView.animate(withDuration: 2, animations: {
                                self.messageLabel.alpha = 0
                            })
                        })
                    }
                    
                    
                    
                }
            }
        }
    }
    
    @IBAction func logOut(_ sender: UIButton) {
        logInButton.isHidden = false
        accountTextField.isHidden = false
        accountLabel.isHidden = false
        passwordTextField.isHidden = false
        passwordLabel.isHidden = false
        confirmTextField.isHidden = false
        confirmLabel.isHidden = false
        nameTextField.isEnabled = true
        startButton.isEnabled = false
        signUpButton.isHidden = false
        nameTextField.text = ""
        accountTextField.text = ""
        passwordTextField.text = ""
        confirmTextField.text = ""
        UserDefaults.standard.set(nil, forKey: "api_token")
        coin = 0
    }
    
    @IBAction func logIn(_ sender: UIButton) {
        if (accountTextField.text != nil) && (passwordTextField.text != nil) {
            
            APIrequest.shared.logIn(accountTextField.text!, passwordTextField.text!) { (response) in
                if response.result == "success" {
                    DispatchQueue.main.async {
                        self.nameTextField.text = response.data?.name
                        self.nameTextField.isEnabled = false
                        self.accountLabel.isHidden = true
                        self.passwordLabel.isHidden = true
                        self.confirmLabel.isHidden = true
                        self.accountTextField.isHidden = true
                        self.passwordTextField.isHidden = true
                        self.confirmTextField.isHidden = true
                        self.logOutButton.isHidden = false
                        self.startButton.isEnabled = true
                        self.logInButton.isHidden = true
                        self.signUpButton.isHidden = true
                        self.shopButton.isEnabled = true
                        
                        UIView.animate(withDuration: 2, animations: {
                            self.messageLabel.text = "Welcome, \(response.data?.name ?? "")"
                            self.messageLabel.alpha = 1
                        }, completion: { (_) in
                            UIView.animate(withDuration: 4, animations: {
                                self.messageLabel.alpha = 0
                            })
                        })
                    }
                    self.coin = (response.data?.balance!)!
                    UserDefaults.standard.set(response.data?.api_token!, forKey: "api_token")
                } else {
                    DispatchQueue.main.async {
                        self.messageLabel.text = "theres some error"
                        UIView.animate(withDuration: 2, animations: {
                            self.messageLabel.alpha = 1
                        }, completion: { (_) in
                            UIView.animate(withDuration: 4, animations: {
                                self.messageLabel.alpha = 0
                            })
                        })
                    }
                }
            }
        }
    }
    
    @IBAction func showShop(_ sender: UIButton) {
        let token = UserDefaults.standard.string(forKey: "api_token")
        APIrequest.shared.askForOwnedItem(token!) { (response) in
            DispatchQueue.main.async {
                self.ownedList = response.data.filter() {$0.game_id == 3}.map() { $0.item_id }
                self.performSegue(withIdentifier: "showShop", sender: sender)
            }
        }
        
        self.performSegue(withIdentifier: "showShop", sender: sender)
    }
    
    
    @IBAction func startGame(_ sender: UIButton) {
        let took = UserDefaults.standard.string(forKey: "api_token")
        print(took!)
        if let token = UserDefaults.standard.string(forKey: "api_token") {
            
            APIrequest.shared.startGame(token) { (response) in
                
                DispatchQueue.main.async {
                    if response.result == "success" {
                        self.coin = (response.data?.balance!)!
                    }
                    if self.coin >= 10 {
                        self.achieveCount += 1
                        UserDefaults.standard.set(self.achieveCount, forKey: "achieveCount")
                        
                        switch self.achieveCount {
                        case 2:
                            APIrequest.shared.saveAchieve(token, "14", result: { (_) in
                                return
                            })
                        case 10:
                            APIrequest.shared.saveAchieve(token, "15", result: { (_) in
                                return
                            })
                        case 100:
                            APIrequest.shared.saveAchieve(token, "16", result: { (_) in
                                return
                            })
                        default:
                            break
                        }
                        self.performSegue(withIdentifier: "showGame", sender: sender)
                    }
                }
                
                
            }
        }
        
        
    }
    
    @IBAction func playHistory(_ sender: UIButton) {
        
        performSegue(withIdentifier: "showHistory", sender: sender)
        
    }
    
    
    @IBAction func viewAchieve(_ sender: UIButton) {
        
        performSegue(withIdentifier: "showAchieve", sender: sender)
    }
    
    
    @IBAction func viewAchieveAll(_ sender: UIButton) {
        
        performSegue(withIdentifier: "showAchieveAll", sender: sender)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "showGame":
            let destinationViewController = segue.destination as! GameViewController
            destinationViewController.name = ""
        case "showHistory":
            break
        case "showAchieve":
            break
        case "showAchieveAll":
            break
        case "showShop":
            let destinationViewController = segue.destination as! DepositViewController
            destinationViewController.coin = coin
            destinationViewController.ownedList = ownedList
            break
        default:
            break
        }
        
    }
    
    @IBAction func backToMenu(segue: UIStoryboardSegue) {}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let int = UserDefaults.standard.value(forKey: "achieveCount") as? Int {
            achieveCount = int
        }
        
        
        messageLabel.alpha = 0
        
        logInButton.isHidden = true
        accountTextField.isHidden = true
        accountLabel.isHidden = true
        passwordTextField.isHidden = true
        passwordLabel.isHidden = true
        confirmTextField.isHidden = true
        confirmLabel.isHidden = true
        nameTextField.isEnabled = false
        startButton.isEnabled = false
        shopButton.isEnabled = false
        
        if let token = UserDefaults.standard.value(forKey: "api_token") as? String {
            APIrequest.shared.autoLogIn(token) { (response) in
                if response.result == "success" {
                    print("inside")
                    DispatchQueue.main.async {
                        self.nameTextField.text = response.data?.name
                    }
                    
                    self.coin = (response.data?.balance!)!
                    UserDefaults.standard.set(response.data?.api_token, forKey: "api_token")
                    DispatchQueue.main.async {
                        self.startButton.isEnabled = true
                        self.signUpButton.isHidden = true
                        self.shopButton.isEnabled = true
                    }
                    
                } else {
                    
                    DispatchQueue.main.async {
                        self.logInButton.isHidden = false
                        self.accountTextField.isHidden = false
                        self.accountLabel.isHidden = false
                        self.passwordTextField.isHidden = false
                        self.passwordLabel.isHidden = false
                        self.confirmTextField.isHidden = false
                        self.confirmLabel.isHidden = false
                        self.nameTextField.isEnabled = true
                        self.signUpButton.isHidden = false
                        self.startButton.isEnabled = false
                        self.shopButton.isEnabled = false
                    }
                    
                }
            }
        } else {
            coin = 0
            logInButton.isHidden = false
            logOutButton.isHidden = true
            accountTextField.isHidden = false
            accountLabel.isHidden = false
            passwordTextField.isHidden = false
            passwordLabel.isHidden = false
            confirmTextField.isHidden = false
            confirmLabel.isHidden = false
            nameTextField.isEnabled = true
        }
        
    }

}


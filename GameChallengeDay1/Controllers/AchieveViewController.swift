//
//  AchieveViewController.swift
//  GameChallengeDay1
//
//  Created by z on 2018/12/18.
//  Copyright © 2018年 z. All rights reserved.
//

import UIKit

class AchieveViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    

    var achieveHistory = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achieveHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = achieveHistory[indexPath.row]
        
        return cell!
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let token = UserDefaults.standard.string(forKey: "api_token") {
            APIrequest.shared.askForAchieveAll(token) { (response) in
                let array = response.data.map() { $0.achieve_id }
                for item in array {
                    switch item {
                    case 14:
                        self.achieveHistory.append("初次探險                     進入遊戲1次")
                    case 15:
                        self.achieveHistory.append("逐漸麻痺                     進入遊戲10次")
                    case 16:
                        self.achieveHistory.append("膽大包天                     進入遊戲100次")
                    default:
                        break
                    }
                }
                
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }
        }
        
    }
    

}

//
//  PlayHistoryViewController.swift
//  GameChallengeDay1
//
//  Created by z on 2018/12/17.
//  Copyright © 2018年 z. All rights reserved.
//

import UIKit

class PlayHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    
    var playRecord = [String]()
    var playRecordInt = [Int]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playRecord.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = playRecord[indexPath.row]
        
        switch playRecordInt[indexPath.row] {
        case 2:
            cell?.imageView?.image = UIImage(named: "puzzle")
        case 3:
            cell?.imageView?.image = UIImage(named: "lighton")
        case 4:
            cell?.imageView?.image = UIImage(named: "shake")
        case 5:
            cell?.imageView?.image = UIImage(named: "save")
        default:
            break
        }
        return cell!
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let token = UserDefaults.standard.string(forKey: "api_token") {
            APIrequest.shared.askForPlayHistory(token) { (response) in
                self.playRecord = response.data.map() { $0.updated_at + "       " + $0.description + "       " +  String($0.amount) }
                self.playRecordInt = response.data.map() { $0.game_id }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }
            
            
        }
        
        
    }

}

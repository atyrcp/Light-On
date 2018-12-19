//
//  AchieveAllViewController.swift
//  GameChallengeDay1
//
//  Created by z on 2018/12/18.
//  Copyright © 2018年 z. All rights reserved.
//

import UIKit

class AchieveAllViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    
    var achieveHistory = [String]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achieveHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = achieveHistory[indexPath.row]
        switch cell?.textLabel?.text {
        case "Puzzle":
            cell?.imageView?.image = UIImage(named: "Puzzle")
        case "Light On":
            cell?.imageView?.image = UIImage(named: "Light On")
        case "Keep Sharking":
            cell?.imageView?.image = UIImage(named: "Keep Sharking")
        default:
            break
        }
        
        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let token = UserDefaults.standard.string(forKey: "api_token") {
            APIrequest.shared.askForAchieveAll(token) { (response) in
                let array = response.data.map() { $0.achieve_id }
                for item in array {
                    switch item {
                    case 1:
                        self.achieveHistory.append("試水溫" + "               " + "遊戲總次數 1次")
                    case 2:
                        self.achieveHistory.append("新手" + "               " + "遊戲總次數 10次")
                    case 3:
                        self.achieveHistory.append("駕輕就熟" + "               " + "遊戲總次數 50次")
                    case 4:
                        self.achieveHistory.append("老手" + "               " + "遊戲總次數 100次")
                    case 5:
                        self.achieveHistory.append("遊戲成癮者" + "               " + "遊戲總次數 200次")
                    case 6:
                        self.achieveHistory.append("低消" + "               " + "儲值金額 50元")
                    case 7:
                        self.achieveHistory.append("半張小朋友" + "               " + "儲值金額 500元")
                    case 8:
                        self.achieveHistory.append("好野人" + "               " + "儲值金額 1000元")
                    case 9:
                        self.achieveHistory.append("土豪" + "               " + "儲值金額 2000元")
                    default:
                        break
                    }
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
                
            }
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

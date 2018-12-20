//
//  GameViewController.swift
//  GameChallengeDay1
//
//  Created by z on 2018/12/17.
//  Copyright © 2018年 z. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var backGroundImageView: UIImageView! {
        didSet {
            backGroundImageView.image = UIImage(named: "hall")
        }
    }
    
    
    @IBOutlet var lightCollection: [LightImageView]!
    var lightCollectionCopy = [LightImageView]()
    
    @IBOutlet weak var ghostImageView: UIImageView!

    
    @IBOutlet weak var segment1: UISegmentedControl!
    @IBOutlet weak var segment2: UISegmentedControl!
    @IBOutlet weak var segment3: UISegmentedControl!
    
    @IBOutlet weak var snapShotImageView: UIImageView!
    @IBOutlet weak var backToMenuButton: UIButton!
    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var sheepImageView: UIImageView!
    
    
    
    
    @IBAction func segment1(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            for light in lightControl1 {
                light.isOn = !light.isOn
            }
            checkIfWin(lightCollection)
        } else if sender.selectedSegmentIndex == 1 {
            for light in lightControl2 {
                light.isOn = !light.isOn
            }
            checkIfWin(lightCollection)
        } else if sender.selectedSegmentIndex == 2 {
            for light in lightControl3 {
                light.isOn = !light.isOn
            }
            checkIfWin(lightCollection)
        }
    }
    
    @IBAction func segment2(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            for light in lightControl4 {
                light.isOn = !light.isOn
            }
            checkIfWin(lightCollection)
        } else if sender.selectedSegmentIndex == 1 {
            for light in lightControl5 {
                light.isOn = !light.isOn
            }
            checkIfWin(lightCollection)
        } else if sender.selectedSegmentIndex == 2 {
            for light in lightControl6 {
                light.isOn = !light.isOn
            }
            checkIfWin(lightCollection)
        }
    }
    
    @IBAction func segment3(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            for light in lightControl7 {
                light.isOn = !light.isOn
            }
            checkIfWin(lightCollection)
        } else if sender.selectedSegmentIndex == 1 {
            for light in lightControl8 {
                light.isOn = !light.isOn
            }
            checkIfWin(lightCollection)
        } else if sender.selectedSegmentIndex == 2 {
            for light in lightControl9 {
                light.isOn = !light.isOn
            }
            checkIfWin(lightCollection)
        }
    }
    
    
    @IBAction func backToMenu(_ sender: UIButton) {
        print("did tap")
    }
    
    
    
    
    
    var lightControl1 = [LightImageView]()
    var lightControl2 = [LightImageView]()
    var lightControl3 = [LightImageView]()
    var lightControl4 = [LightImageView]()
    var lightControl5 = [LightImageView]()
    var lightControl6 = [LightImageView]()
    var lightControl7 = [LightImageView]()
    var lightControl8 = [LightImageView]()
    var lightControl9 = [LightImageView]()
    
    var checkIfWinArray = [Bool]()
    
    var name = ""
    
    func setGame() -> [LightImageView] {
        var lights = [LightImageView]()
        for _ in 1...2 {
            let light = lightCollectionCopy.randomElement()
            lightCollectionCopy = lightCollectionCopy.filter(){ $0.center != light?.center }
            print(lightCollectionCopy.count)
            lights.append(light!)
        }
        return lights
    }
    
    func checkIfWin(_ lightsArray: [LightImageView]) {
        let newArray = lightsArray.map(){ $0.isOn }
        if newArray == checkIfWinArray {
            print("winnnnn")
            backToMenuButton.frame = self.view.frame
            backToMenuButton.setTitle("You Win!", for: .normal)
            backToMenuButton.isHidden = false
        } else {
            print("nooo")
        }
    }
    
    @objc func longPressGesture(longPressGesture: UILongPressGestureRecognizer) {
        switch longPressGesture.state {
        case .began:
            print("pressing")
        case .changed:
            snapShotImageView.isHidden = false
        case .ended:
            snapShotImageView.isHidden = true
        default:
            return
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let longpress = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressGesture(longPressGesture:)) )
        self.view.addGestureRecognizer(longpress)
        
        
        lightCollectionCopy = lightCollection
        segment1.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        segment2.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        segment3.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        segment1.setTitle("✙", forSegmentAt: 0)
        segment1.setTitle("✚", forSegmentAt: 1)
        segment1.setTitle("✛", forSegmentAt: 2)
        segment2.setTitle("✙", forSegmentAt: 0)
        segment2.setTitle("✚", forSegmentAt: 1)
        segment2.setTitle("✛", forSegmentAt: 2)
        segment3.setTitle("✙", forSegmentAt: 0)
        segment3.setTitle("✚", forSegmentAt: 1)
        segment3.setTitle("✛", forSegmentAt: 2)
        
        backToMenuButton.isHidden = true
        
        lightControl1 = setGame()
        lightControl2 = setGame()
        lightControl3 = setGame()
        lightControl4 = setGame()
        lightControl5 = setGame()
        lightControl6 = setGame()
        lightControl7 = setGame()
        lightControl8 = setGame()
        lightControl9 = setGame()
        
        lineLabel.alpha = 0
        
        let randomNumber1 = [1, 2, 3].randomElement()
        let randomNumber2 = [4, 5, 6].randomElement()
        let randomNumber3 = [7, 8, 9].randomElement()
        
        
        
        switch randomNumber1 {
        case 1:
            for light in lightControl1 {
                light.isOn = true
            }
        case 2:
            for light in lightControl2 {
                light.isOn = true
            }
        case 3:
            for light in lightControl3 {
                light.isOn = true
            }
        default:
            return
        }

        switch randomNumber2 {
        case 4:
            for light in lightControl4 {
                light.isOn = true
            }
        case 5:
            for light in lightControl5 {
                light.isOn = true
            }
        case 6:
            for light in lightControl6 {
                light.isOn = true
            }
        default:
            return
        }

        switch randomNumber3 {
        case 7:
            for light in lightControl7 {
                light.isOn = true
            }
        case 8:
            for light in lightControl8 {
                light.isOn = true
            }
        case 9:
            for light in lightControl9 {
                light.isOn = true
            }
        default:
            return
        }
        
        
        print((randomNumber1, randomNumber2, randomNumber3))
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.ghostImageView.image = UIImage(named: "nine")
            self.segment1.isEnabled = false
            self.segment2.isEnabled = false
            self.segment3.isEnabled = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.ghostImageView.image = UIImage(named: "eight")
            
            
            self.sheepImageView.center = self.view.center
            self.sheepImageView.alpha = 1
            self.sheepImageView.image = UIImage(named: "sheep")
            
            UIView.animate(withDuration: 1.5, animations: {
                let last = CGPoint(x: self.sheepImageView.center.x - 40, y: self.sheepImageView.center.y + 25)
                self.sheepImageView.center = last
            })
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.ghostImageView.image = UIImage(named: "seven")
            
            UIView.animate(withDuration: 1.5, animations: {
                let last = CGPoint(x: self.sheepImageView.center.x + 40, y: self.sheepImageView.center.y + 35)
                self.sheepImageView.center = last
            })
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.ghostImageView.image = UIImage(named: "six")
            
            UIView.animate(withDuration: 1.5, animations: {
                let last = CGPoint(x: self.sheepImageView.center.x + 10, y: self.sheepImageView.center.y + 45)
                self.sheepImageView.center = last
            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.ghostImageView.image = UIImage(named: "five")
            
            UIView.animate(withDuration: 1, animations: {
                let last = CGPoint(x: self.sheepImageView.center.x - 15, y: self.sheepImageView.center.y + 45)
                self.sheepImageView.center = last
            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.ghostImageView.image = UIImage(named: "four")
            
            UIView.animate(withDuration: 1.5, animations: {
                let last = CGPoint(x: self.sheepImageView.center.x, y: self.sheepImageView.center.y + 45)
                self.sheepImageView.center = last
            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.ghostImageView.image = UIImage(named: "three")
            
            UIView.animate(withDuration: 1.5, animations: {
                let last = CGPoint(x: self.sheepImageView.center.x - 40, y: self.sheepImageView.center.y + 45)
                self.sheepImageView.center = last
            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            self.ghostImageView.image = UIImage(named: "two")
            
            UIView.animate(withDuration: 1.5, animations: {
                let last = CGPoint(x: self.sheepImageView.center.x - 40, y: self.sheepImageView.center.y + 45)
                self.sheepImageView.center = last
            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            self.ghostImageView.image = UIImage(named: "one")
            
            UIView.animate(withDuration: 1.5, animations: {
                let last = CGPoint(x: self.sheepImageView.center.x + 70, y: self.sheepImageView.center.y + 145)
                self.sheepImageView.center = last
            })
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
            self.ghostImageView.image = nil
            
            UIGraphicsBeginImageContextWithOptions(self.view.frame.size, true, 0)
            guard let context = UIGraphicsGetCurrentContext() else { return }
            self.view.layer.render(in: context)
            guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return }
            UIGraphicsEndImageContext()
            
            self.snapShotImageView.image = image
            self.snapShotImageView.isHidden = true
            
            self.view.bringSubviewToFront(self.segment1)
            self.view.bringSubviewToFront(self.segment2)
            self.view.bringSubviewToFront(self.segment3)
            
            for light in self.lightCollection {
                self.checkIfWinArray.append(light.isOn)
            }
            
            print(self.checkIfWinArray)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.lineLabel.text = "Im Coming for you, \(self.name)"
            self.lineLabel.center = self.view.center
            self.lineLabel.textColor = .white
            UIView.animate(withDuration: 2, animations: {
                self.lineLabel.alpha = 1
            }, completion: { (_) in
                UIView.animate(withDuration: 2, animations: {
                    self.lineLabel.alpha = 0
                })
            })
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
            self.ghostImageView.image = nil
            self.ghostImageView.alpha = 0
            for i in self.lightCollection {
                i.isOn = false
            }
            
            self.segment1.isEnabled = true
            self.segment2.isEnabled = true
            self.segment3.isEnabled = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
            if let item = UserDefaults.standard.string(forKey: "item") {
                self.ghostImageView.image = UIImage(named: item)
            } else {
                self.ghostImageView.image = UIImage(named: "ghost")
            }
            UIView.animate(withDuration: 10, animations: {
                self.ghostImageView.alpha = 1
            })
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 40) {
            
            UIView.animate(withDuration: 20, animations: {
                let lastPosition = CGPoint(x: self.ghostImageView.center.x, y: self.ghostImageView.center.y + 550)
                
                self.ghostImageView.center = lastPosition
                self.ghostImageView.transform = CGAffineTransform(scaleX: 10, y: 10)
                
                
            }, completion: { (_) in
                self.backToMenuButton.frame = self.view.frame
                self.backToMenuButton.isHidden = false
                self.backToMenuButton.setTitle("You Lose", for: .normal)
            })
            
        }
        
        
    }
    

}

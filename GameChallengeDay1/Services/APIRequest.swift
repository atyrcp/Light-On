//
//  APIRequest.swift
//  GameChallengeDay1
//
//  Created by z on 2018/12/18.
//  Copyright © 2018年 z. All rights reserved.
//

import Foundation
import UIKit

class APIrequest {
    
    private init() {}
    static let shared = APIrequest()
    typealias completionHandle = (_ responseData: ResponseData) -> Void
    typealias completionHandle2 = (_ responseData: ResponseSignUp) -> Void
    typealias completionHandle3 = (_ responseData: ResponseAutoLogIn) -> Void
    typealias completionHandle4 = (_ responseData: ResponseAchieve) -> Void
    typealias completionHandle5 = (_ responseData: ResponsePlayHistory) -> Void
    typealias completionHandle6 = (_ responseData: ResponseShop) -> Void
    
    func signUp(_ name: String, _ email: String, _ password: String, _ passwordConfirm: String, result: @escaping completionHandle2) {
        guard let url = URL(string: "http://ba33b5ee.ngrok.io/api/register") else {return}
        
        var requset = URLRequest(url: url)
        requset.httpMethod = "POST"
        requset.setValue("application/json", forHTTPHeaderField: "Content-Type")
        requset.setValue("application/json", forHTTPHeaderField: "Accept")
        let userInfo = SignUpInfo(name: name, email: email, password: password, password_confirmation: passwordConfirm)
        print(userInfo)
        do {
            let signUpData = try JSONEncoder().encode(userInfo)
            requset.httpBody = signUpData
        } catch {
            print("error occur")
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: requset) { (mydata, myresponse, myerror) in
            guard let data = mydata else {return}
            print(data)
            do {
                let responseData = try JSONDecoder().decode(ResponseSignUp.self, from: data)
                result(responseData)
                print(responseData.data as Any)
            } catch {}
        }
        task.resume()
    }
    
    func logIn(_ email: String, _ password: String, result: @escaping completionHandle) {
        guard let url = URL(string: "http://ba33b5ee.ngrok.io/api/login") else {return}
        
        print("login")
        
        var requset = URLRequest(url: url)
        requset.httpMethod = "POST"
        requset.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requset.addValue("application/json", forHTTPHeaderField: "Accept")
        let userInfo = LogInInfo(email: email, password: password)
        do {
            let logInData = try JSONEncoder().encode(userInfo)
            requset.httpBody = logInData
            print(logInData)
        } catch {
            print("error occur")
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: requset) { (mydata, myresponse, myerror) in
            guard let data = mydata else {return}
            print(data)
            do {
                let responseData = try JSONDecoder().decode(ResponseData.self, from: data)
                result(responseData)
                print(responseData)
            } catch {}
        }
        task.resume()
    }
    
    func autoLogIn(_ token: String, result: @escaping completionHandle3) {
        guard let url = URL(string: "http://ba33b5ee.ngrok.io/api/autologin") else {return}
        
        var requset = URLRequest(url: url)
        requset.httpMethod = "POST"
        requset.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requset.addValue("application/json", forHTTPHeaderField: "Accept")
        let userInfo = Token(token: token)
        do {
            let logInData = try JSONEncoder().encode(userInfo)
            requset.httpBody = logInData
        } catch {
            print("error occur")
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: requset) { (mydata, myresponse, myerror) in
            guard let data = mydata else {return}
            do {
                let responseData = try JSONDecoder().decode(ResponseAutoLogIn.self, from: data)
                result(responseData)
                print(responseData)
            } catch {}
        }
        task.resume()
    }
    
    func startGame(_ token: String, result: @escaping completionHandle) {
        guard let url = URL(string: "http://ba33b5ee.ngrok.io/api/play") else {return}
        
        var requset = URLRequest(url: url)
        requset.httpMethod = "POST"
        requset.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requset.addValue("application/json", forHTTPHeaderField: "Accept")
        let userInfo = StartGameCheck(token: token)
        do {
            let startData = try JSONEncoder().encode(userInfo)
            requset.httpBody = startData
        } catch {
            print("error occur")
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: requset) { (mydata, myresponse, myerror) in
            guard let data = mydata else {return}
            do {
                let responseData = try JSONDecoder().decode(ResponseData.self, from: data)
                result(responseData)
            } catch {}
        }
        task.resume()
    }
    
    
    func askForPlayHistory(_ token: String, result: @escaping completionHandle5) {
        guard let url = URL(string: "http://ba33b5ee.ngrok.io/api/detail") else {return}
        
        var requset = URLRequest(url: url)
        requset.httpMethod = "GET"
        requset.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requset.addValue("application/json", forHTTPHeaderField: "Accept")
        requset.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: requset) { (mydata, myresponse, myerror) in
            guard let data = mydata else {return}
            do {
                let responseData = try JSONDecoder().decode(ResponsePlayHistory.self, from: data)
                result(responseData)
            } catch {}
        }
        task.resume()
    }
    
    
    func saveAchieve(_ token: String, _ id: String, result: @escaping completionHandle2) {
        guard let url = URL(string: "http://ba33b5ee.ngrok.io/api/achievement") else {return}
        
        var requset = URLRequest(url: url)
        requset.httpMethod = "POST"
        requset.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requset.addValue("application/json", forHTTPHeaderField: "Accept")
        let userInfo = SaveAchieve(token: token, id: id)
        do {
            let startData = try JSONEncoder().encode(userInfo)
            requset.httpBody = startData
        } catch {
            print("error occur")
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: requset) { (mydata, myresponse, myerror) in
            guard let data = mydata else {return}
            do {
                let responseData = try JSONDecoder().decode(ResponseSignUp.self, from: data)
                result(responseData)
            } catch {}
        }
        task.resume()
    }
    
    
    func askForAchieveAll(_ token: String, result: @escaping completionHandle4) {
        guard let url = URL(string: "http://ba33b5ee.ngrok.io/api/achievement") else {return}
        
        var requset = URLRequest(url: url)
        requset.httpMethod = "GET"
        requset.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requset.addValue("application/json", forHTTPHeaderField: "Accept")
        requset.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: requset) { (mydata, myresponse, myerror) in
            guard let data = mydata else {return}
            do {
                let responseData = try JSONDecoder().decode(ResponseAchieve.self, from: data)
                result(responseData)
            } catch {}
        }
        task.resume()
    }
    
    func purchaseItem(_ token: String, _ itemId: Int, result: @escaping completionHandle) {
        guard let url = URL(string: "http://ba33b5ee.ngrok.io/api/shop") else {return}
        
        var requset = URLRequest(url: url)
        requset.httpMethod = "POST"
        requset.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requset.addValue("application/json", forHTTPHeaderField: "Accept")
        let userInfo = PurchaseItem(id: itemId, token: token)
        do {
            let startData = try JSONEncoder().encode(userInfo)
            requset.httpBody = startData
        } catch {
            print("error occur")
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: requset) { (mydata, myresponse, myerror) in
            guard let data = mydata else {return}
            do {
                let responseData = try JSONDecoder().decode(ResponseData.self, from: data)
                result(responseData)
                print(responseData)
            } catch {}
        }
        task.resume()
    }
    
    
    func askForOwnedItem(_ token: String, result: @escaping completionHandle6) {
        guard let url = URL(string: "http://ba33b5ee.ngrok.io/api/shop/3") else {return}
        
        var requset = URLRequest(url: url)
        requset.httpMethod = "GET"
        requset.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requset.addValue("application/json", forHTTPHeaderField: "Accept")
        requset.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: requset) { (mydata, myresponse, myerror) in
            guard let data = mydata else {return}
            do {
                let responseData = try JSONDecoder().decode(ResponseShop.self, from: data)
                result(responseData)
                print(responseData)
            } catch {}
        }
        task.resume()
    }
    
    func getBalance(_ token: String, result: @escaping completionHandle) {
        guard let url = URL(string: "http://ba33b5ee.ngrok.io/api/shop/3") else {return}
        
        var requset = URLRequest(url: url)
        requset.httpMethod = "GET"
        requset.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requset.addValue("application/json", forHTTPHeaderField: "Accept")
        requset.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: requset) { (mydata, myresponse, myerror) in
            guard let data = mydata else {return}
            do {
                let responseData = try JSONDecoder().decode(ResponseData.self, from: data)
                result(responseData)
            } catch {}
        }
        task.resume()
    }
    
}

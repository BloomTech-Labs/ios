//
//  LoginController.swift
//  BestPlacesToLive
//
//  Created by Thomas Cacciatore on 8/27/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

class LoginController {
    
    private let baseURL = URL(string: "http://162.243.168.251/users/")!
    
    var bearer: Bearer?
    var loggedInUser: LoggedInUser?

    func signUp(with user: User, completion: @escaping (Error?) -> Void) {
        
        var request = URLRequest(url: baseURL.appendingPathComponent("register"))
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonEncoder = JSONEncoder()
        
        do {
            let jsonData = try jsonEncoder.encode(user)
            request.httpBody = jsonData
            print(String(data: jsonData, encoding: .utf8)!)
            print(request)
        } catch {
            print("Error encoding user: \(error)")
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (_, response, error) in
            
            
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
               
                return
            }
            
            if let error = error {
                NSLog("Error posting User: \(error)")
                completion(error)
                return
            }
            
            completion(nil)
        }.resume()
    }
    
    func signIn(with signInUser: SignInUser, completion: @escaping (Error?) -> Void) {
        
        var request = URLRequest(url: baseURL.appendingPathComponent("login"))
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonEncoder = JSONEncoder()
        
        do {
            let jsonData = try jsonEncoder.encode(signInUser)
            request.httpBody = jsonData
        } catch {
            print("Error encoding user: \(error)")
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                return
            }
            
            if let error = error {
                NSLog("Error posting User: \(error)")
                completion(error)
                return
            }
            
            guard let data = data else {
                completion(NSError())
                return
            }
            print(String(decoding: data, as: UTF8.self))
//            let decoder = JSONDecoder()
//            do {
//               self.loggedInUser = try decoder.decode(LoggedInUser.self, from: data)
//            } catch {
//                completion(error)
//                return
//            }
            
            completion(nil)
            }.resume()
    }
    
    
    
}

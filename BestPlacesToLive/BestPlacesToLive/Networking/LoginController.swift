//
//  LoginController.swift
//  BestPlacesToLive
//
//  Created by Thomas Cacciatore on 8/27/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

class LoginController {
    
    private let baseURL = URL(string: "http://stagingbe.letsmovehomie.com:3001/users/")!
    
    var bearer: Bearer?
    

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
    
    func signIn(with user: User, completion: @escaping (Error?) -> Void) {
        
        var request = URLRequest(url: baseURL.appendingPathComponent("login"))
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonEncoder = JSONEncoder()
        
        do {
            let jsonData = try jsonEncoder.encode(user)
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
            
            let decoder = JSONDecoder()
            do {
               self.bearer = try decoder.decode(Bearer.self, from: data)
            } catch {
                completion(error)
                return
            }
            
            completion(nil)
            }.resume()
    }
    
    
    
}

//
//  TestController.swift
//  BestPlacesToLive
//
//  Created by Thomas Cacciatore on 8/21/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

class TestController {
    var testString: String?
    
    let baseURL = URL(string: "http://167.71.246.208:3001/")!
    
    func fetchTestData(completion: @escaping (Error?) -> Void) {
        let request = URLRequest(url: baseURL)
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error getting test String: \(error)")
                completion(error)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            print(data)
            let str = String(decoding: data, as: UTF8.self)
            print(str)
            
            self.testString = str
            completion(nil)
            }.resume()
    }
}

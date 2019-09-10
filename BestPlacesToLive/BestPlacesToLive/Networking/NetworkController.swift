//
//  NetworkController.swift
//  BestPlacesToLive
//
//  Created by Lambda_School_Loaner_148 on 8/22/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

class NetworkingController {
    
  
    
    private let baseURL = URL(string: "https://stagebe.letsmovehomie.com/city")!
    
 
    var topCities: [City] = []
    var allCities: [City]
    = []
    
    
    func getAllCities(completion:@escaping ([City]?, Error?) -> Void) {
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET"
        
        let decoder = JSONDecoder()
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching top 10 cities from Task: \(error)")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
            NSLog("Bad data from baseurl task")
            completion(nil, NSError())
            return
        }
        
        do {
            let decodedCities = try decoder.decode([City].self, from: data)
          print(self.allCities = decodedCities)
            completion(decodedCities, nil)
            
        } catch {
            NSLog("Error fetching all cities: \(error)")
            completion(nil, error)
            return
        }
}
    
    func getTopCities(completion: @escaping ([City]?, Error?) -> Void) {
        
        let url = baseURL.appendingPathComponent("topten-cost-of-living")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let decoder = JSONDecoder()
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching top 10 cities from Task: \(error)")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                NSLog("Bad data from top 10 Datatask")
                completion(nil, NSError())
                return
            }
            
            do {
                let decodedCities = try decoder.decode([City].self, from: data)
                self.topCities = decodedCities
                completion(decodedCities, nil)
                
                
            } catch {
                NSLog("Error decoding Cities: \(error)")
                completion(nil, error)
                return
                
            }
            }.resume()
        
        
    }
}
}

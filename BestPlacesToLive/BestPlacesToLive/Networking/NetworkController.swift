//
//  NetworkController.swift
//  BestPlacesToLive
//
//  Created by Lambda_School_Loaner_148 on 8/22/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

class NetworkingController {
    
    private let baseURL = URL(string: "https://167.71.246.208:3001/")!
    var cities: [City] = []
    
    func getTopCities(completion: @escaping (Error?) -> Void) {
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET"
        
        let decoder = JSONDecoder()
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching cities from Task: \(error)")
                completion(error)
                return
            }
            
            guard let data = data else {
                NSLog("Bad data from task: \(error)")
                completion(NSError())
                return
            }
            
            do {
                let decodedCities = try decoder.decode([City].self, from: data)
                self.cities = decodedCities
                
            } catch {
                NSLog("Error decoding Cities: \(error)")
                completion(nil)
                return
                
            }
            }.resume()
        
        
    }
}

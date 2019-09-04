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
    var states = [City(name:"Florida" , id: "1"), City(name: "California", id: "2"), City(name: "Alabama", id: "3"), City(name: "Georgia", id: "4"), City(name: "Ohio", id: "5"), City(name: "Michigan", id: "6"), City(name: "Montana", id: "7"), City(name: "Utah", id: "8"),
                  City(name: "Luda luda", id: "9"), City(name: "Indiana", id: "10")]
    
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
                NSLog("Error: No data returned or bad data")
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

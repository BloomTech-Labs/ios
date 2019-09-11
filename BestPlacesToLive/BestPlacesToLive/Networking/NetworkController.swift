//
//  NetworkController.swift
//  BestPlacesToLive
//
//  Created by Lambda_School_Loaner_148 on 8/22/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

class NetworkingController {
    
    private let baseURL = URL(string: "https://stagebe.letsmovehomie.com/city/topten-cost-of-living/")!
    
    func getTopCities(completion: @escaping ([City]?, Error?) -> Void) {
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET"
        
        let decoder = JSONDecoder()
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching cities from Task: \(error)")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                NSLog("Error: No data returned or bad data")
                completion(nil, NSError())
                return
            }
            
            do {
                let decodedCities = try decoder.decode(TopCities.self, from: data)
                let cities = decodedCities.cities
                completion(cities, nil)
                
            } catch {
                NSLog("Error decoding Cities: \(error)")
                completion(nil, error)
                return
                
            }
            }.resume()
        }
}

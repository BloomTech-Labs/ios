//
//  NetworkController.swift
//  BestPlacesToLive
//
//  Created by Lambda_School_Loaner_148 on 8/22/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

class NetworkingController {
    
  
    
    private let baseURL = URL(string: "https://demo0969329.mockable.io/topten")!
    
    var categories = [CityCategory(category: "Income", imageName: "Income"),
                       CityCategory(category: "Crime", imageName: "Crime"),
                       CityCategory(category: "Weather", imageName: "Weather"),
                        CityCategory(category: "School", imageName: "School")]
    
    // mock states:
/*    [BestPlacesToLive.City(id: "1", name: "Florida"), BestPlacesToLive.City(id: "2", name: "California"), BestPlacesToLive.City(id: "3", name: "Alabama"), BestPlacesToLive.City(id: "4", name: "Georgia"), BestPlacesToLive.City(id: "5", name: "Ohio"), BestPlacesToLive.City(id: "6", name: "Michigan"), BestPlacesToLive.City(id: "7", name: "Montana"), BestPlacesToLive.City(id: "8", name: "Utah"), BestPlacesToLive.City(id: "9", name: "Luda luda"), BestPlacesToLive.City(id: "10", name: "Indiana")]
    */
    var states = [City(name:"Florida" , id: "1"), City(name: "California", id: "2"), City(name: "Alabama", id: "3"), City(name: "Georgia", id: "4"), City(name: "Ohio", id: "5"), City(name: "Michigan", id: "6"), City(name: "Montana", id: "7"), City(name: "Utah", id: "8"),
    City(name: "Luda luda", id: "9"), City(name: "Indiana", id: "10")]
    
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
                NSLog("Bad data from Datatask")
                completion(nil, NSError())
                return
            }
            
            do {
                let decodedCities = try decoder.decode([City].self, from: data)
                completion(decodedCities, nil)
                return
                
            } catch {
                NSLog("Error decoding Cities: \(error)")
                completion(nil, error)
                return
                
            }
            }.resume()
        
        
    }
}

//
//  NetworkController.swift
//  BestPlacesToLive
//
//  Created by Lambda_School_Loaner_148 on 8/22/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

class NetworkingController {
    
    private let baseURL = URL(string: "https://stagebe.letsmovehomie.com/city/")!
    
    
    func getTopCities(completion: @escaping ([City]?, Error?) -> Void) {
        
        let topCitiesURL = baseURL.appendingPathComponent("topten-cost-of-living/")
        var request = URLRequest(url: topCitiesURL)
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
    
    func searchCities(searchTerm: String, completion: @escaping ([City]?, Error?) -> Void) {
        
        let searchURL = baseURL.appendingPathComponent("search/")
        let cityToSearch = SearchTerm(searchTerm: searchTerm)
        var request = URLRequest(url: searchURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonEncoder = JSONEncoder()
        
        do {
            let jsonData = try jsonEncoder.encode(cityToSearch)
            request.httpBody = jsonData
            print(String(data: jsonData, encoding: .utf8)!)
            print(request)
        } catch {
            print("Error encoding user: \(error)")
            completion(nil, error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(nil, NSError(domain: "", code: response.statusCode, userInfo: nil))
                
                return
            }
            
            if let error = error {
                NSLog("Error posting User: \(error)")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                NSLog("No data returned")
                completion(nil, error)
                return
            }
            let decoder = JSONDecoder()
            
            do {
                let decodedCities = try decoder.decode(SearchedCities.self, from: data)
                let cities = decodedCities.cities
                completion(cities, nil)
            } catch {
                NSLog("Error searching cities: \(error)")
                completion(nil, error)
                return
            }
        }.resume()
    }
    
    
    func getSavedCities(completion: @escaping (Error?) -> Void) {
        
        // NEED Saved Cities URL
        let savedCitiesURL = baseURL
        
        var request = URLRequest(url: savedCitiesURL)
        request.httpMethod = "GET"
        
        
        
    }
    
    
}

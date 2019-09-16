//
//  City.swift
//  BestPlacesToLive
//
//  Created by Lambda_School_Loaner_148 on 8/22/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation


struct City: Codable, Equatable {
    
    let id: String
    let name: String
    let costOfLiving: String
    let avgCommuteTime: Float
    let photo: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case costOfLiving = "cost_of_living"
        case avgCommuteTime = "avg_commute_time"
        case name
        case photo
    }
}

struct TopCities: Codable {
    var cities: [City]
}

struct SearchedCities: Codable {
    var cities: [City]
}

struct CityIDs: Codable {
    var ids: [String]
}

struct SavedCity: Codable {
    let cityID: String
    let cityName: String
    let cityPhoto: String
    
    enum CodingKeys: String, CodingKey {
        case cityID = "city_id"
        case cityName = "city_name"
        case cityPhoto = "city_photo"
    }
}

struct ReturnedSavedCity: Codable {
    let id: String
    let name: String
    let photo: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case photo
    }
}

struct CityData: Codable {
    let data: [City]
}

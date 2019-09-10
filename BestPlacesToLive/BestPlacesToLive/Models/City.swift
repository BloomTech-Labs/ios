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
    let costOfLiving: Int
    let avgCommuteTime: Int
    
    enum CodingKeys: String, CodingKey {
        
        case id  = "_id"
        case name
        case costOfLiving = "cost_of_living"
        case avgCommuteTime = "avg_commute_time"
    }
    
    
    }

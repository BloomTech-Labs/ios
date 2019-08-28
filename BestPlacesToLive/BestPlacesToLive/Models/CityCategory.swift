//
//  CityCategory.swift
//  BestPlacesToLive
//
//  Created by Lambda_School_Loaner_148 on 8/26/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation
import UIKit

struct CityCategory {
    
    init(category: String, imageName: String) {
        self.category = category
        self.image = UIImage(named: imageName)!
    }

    var category: String
    var image: UIImage
}

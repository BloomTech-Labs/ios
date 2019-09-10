//
//  CityCollectionViewCell.swift
//  BestPlacesToLive
//
//  Created by Lambda_School_Loaner_148 on 8/22/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {
    
    var city: City? {
        didSet {
            updateViews()
        }
    }
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityImageView: UIView!
    
    private func updateViews() {
    
        nameLabel.text = city?.name
        
    }
}

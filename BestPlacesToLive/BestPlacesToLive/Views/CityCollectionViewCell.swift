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
    
    @IBOutlet weak var imageView: UIImageView!
    
    private func updateViews() {
    
        nameLabel.text = city?.name
        nameLabel.textColor = .white
        nameLabel.alpha = 1.0
        
        
        do {
            let cityUrl = URL(string: city!.photo)
            let data = try Data(contentsOf: cityUrl!)
            imageView.image = UIImage(data: data)

            
        } catch {
            NSLog("Error grabbing converting imageURL to Data")
            return
        }
        
    }
}

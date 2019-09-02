//
//  CategoryCollectionViewCell.swift
//  BestPlacesToLive
//
//  Created by Lambda_School_Loaner_148 on 8/22/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    var category: CityCategory? {
       didSet {
          //  updateViews()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.layer.cornerRadius = self.frame.size.width / 2
    }
    
    
    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var catoryNameLabel: UILabel!
    
/*
    private func updateViews() {
        
        if let categoryName = catoryNameLabel.text {
        
        category?.category = categoryName
            
        }
        
        
    }
 */
    
    
  
    
    
}

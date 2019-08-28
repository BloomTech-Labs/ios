//
//  ThemeHelper.swift
//  BestPlacesToLive
//
//  Created by Lambda_School_Loaner_148 on 8/26/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation
import UIKit

enum ThemeHelper {
    
    // MARK: - Custom Colors 
    
    
    static func setupAppearance() {
        
        UINavigationBar.appearance().barTintColor = .blue
        UIBarButtonItem.appearance().tintColor = .white
        
        
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
    }
    
    static func buttonStyle(for button: UIButton) {
        
        button.setTitleColor(.white, for: .normal)
      //  button.backgroundColor = 
        button.layer.cornerRadius = 10.0
        
    }
    
    static func textFieldStyle(for textField: UITextField) {
        
        textField.layer.cornerRadius = 10.0
        
    }
    
    
    
}

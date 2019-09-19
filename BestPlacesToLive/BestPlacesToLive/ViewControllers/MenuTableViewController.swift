//
//  MenuTableViewController.swift
//  BestPlacesToLive
//
//  Created by Thomas Cacciatore on 8/23/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case home
    case savedCities
    case login
    case profile
    case logout
}

class MenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        
        switch menuType {
        case .home:
            dismiss(animated: true)
            print("Dismissing: \(menuType)")
        case .savedCities:
            if UserDefaults.standard.object(forKey: "token") == nil {
                let alert = UIAlertController(title: "Not Logged In", message: "Please log in or create an account.", preferredStyle: .alert)
                alert.addAction((UIAlertAction(title: "OK", style: .default, handler: nil)))
                self.present(alert, animated: true)
            }
        case .login:
            break
        case .profile:
            if UserDefaults.standard.object(forKey: "token") == nil {
                let alert = UIAlertController(title: "Not Logged In", message: "Please log in or create an account.", preferredStyle: .alert)
                alert.addAction((UIAlertAction(title: "OK", style: .default, handler: nil)))
                self.present(alert, animated: true)
            }
        case .logout:
            UserDefaults.standard.removeObject(forKey: "token")
            UserDefaults.standard.removeObject(forKey: "userName")
        }
      
    }

}

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
    case camera
    case profile
}

class MenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        if menuType != .profile {
            dismiss(animated: true) {
                print("Dismissing: \(menuType)")
            }
        }
    }

}

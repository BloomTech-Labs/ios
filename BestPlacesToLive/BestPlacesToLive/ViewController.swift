//
//  ViewController.swift
//  BestPlacesToLive
//
//  Created by Thomas Cacciatore on 8/15/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var testLabel: UILabel!
    
    var testController = TestController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testController.fetchTestData { (error) in
            if let error = error {
                NSLog("Error: \(error)")
            }
            
            DispatchQueue.main.async {
                self.testLabel.text = self.testController.testString
            }
        }

    }


}


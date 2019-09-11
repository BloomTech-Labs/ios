//
//  CityDetailViewController.swift
//  BestPlacesToLive
//
//  Created by Lambda_School_Loaner_148 on 9/11/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var commuteTimeLabel: UILabel!
    @IBOutlet weak var costOfLivingLabel: UILabel!
    
    var city: City? {
        didSet {
            updateViews()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateViews()
    }
    
    private func updateViews() {
        
        guard isViewLoaded else { return }
        guard let city = city else { return }
        
        navigationItem.title = city.name
        
        costOfLivingLabel.text = String("Cost of Living: \(city.cost_of_living)")
        commuteTimeLabel.text = "Average Commute Time: \(city.avg_commute_time)"
        let cityUrl = URL(string: city.photo)
        do {
            let data = try Data(contentsOf: cityUrl!)
        cityImageView.image = UIImage(data: data)
        } catch {
            NSLog("Error getting images from City")
            return
                
        }
        
        
    }
    
    
    
    @IBAction func addCityButtonTapped(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

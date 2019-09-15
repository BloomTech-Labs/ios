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
    var savedCitiesController = SavedCitiesController()
    
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
    
    @IBAction func saveCityButtonTapped(_ sender: Any) {
        guard let city = city else { return }
        let savedCity = SavedCity(city_id: city._id, city_name: city.name, city_photo: city.photo)
        savedCitiesController.addSavedCity(savedCity: savedCity) { (loggedInUser, error) in
            if let error = error {
                //Present Alert: Could not save city to favorites
                NSLog("Error saving city: \(error)")
            } else {
                //Present Alert. "City Saved to favorites"
                print("Saved Cities: \(loggedInUser?.cities as Any)")
            }
        }
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cityName = city?.name
        if segue.identifier == "MapSegue" {
            let destinationVC = segue.destination as! MapViewController
            destinationVC.cityName = cityName
        }
    }

}

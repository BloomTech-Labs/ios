//
//  SavedCitiesDetailViewController.swift
//  BestPlacesToLive
//
//  Created by Thomas Cacciatore on 9/16/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class SavedCitiesDetailViewController: UIViewController {
    
    var savedCitiesController: SavedCitiesController?
    var savedCity: ReturnedSavedCity?
    var city: City?
    
    @IBOutlet weak var savedCityImageView: UIImageView!
    @IBOutlet weak var costOfLivingLabel: UILabel!
    @IBOutlet weak var avgCommuteTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let savedCitiesController = savedCitiesController else { return }
        guard let savedID = savedCity?.id else { return }
        let cityID = CityIDs(ids: [savedID])
        print(cityID)
        savedCitiesController.getSavedCityDetails(cityIDs: cityID) { (city, error) in
            if let error = error {
                NSLog("Error getting city info: \(error)")
                return
            }
            if let city = city {
                self.city = city
                DispatchQueue.main.async {
                    self.updateViews()
                }
            }
        }
        
    }
    
    func updateViews() {
        guard isViewLoaded else { return }
        if let city = city {
            costOfLivingLabel.text = "Cost of living: \(city.costOfLiving)"
            let commute = String(city.avgCommuteTime)
            avgCommuteTimeLabel.text = "Average commute time: \(commute)"
            let imageURL = URL(string: city.photo)!
            let data = try! Data(contentsOf: imageURL)
            savedCityImageView.image = UIImage(data: data)
        }
    }
    

    @IBAction func deleteButtonTapped(_ sender: Any) {
        guard let savedCity = savedCity else { return }
        let cityID = savedCity.id
        let cityToDelete = SavedCity(cityID: cityID, cityName: savedCity.name, cityPhoto: savedCity.photo)
        savedCitiesController?.deleteSavedCity(savedCity: cityToDelete, completion: { (loggedInUser, error) in
            if let error = error {
                NSLog("Error deleting city: \(error)")
                return
            }
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        })
    }
    
 

}
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
    @IBOutlet weak var safetyLabel: UILabel!
    @IBOutlet weak var toleranceLabel: UILabel!
    
    
    
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
        
        costOfLivingLabel.text = String("Cost of Living Grade: \(city.gradeCostOfLiving)")
        commuteTimeLabel.text = "Commute Time Grade: \(city.gradeCommute)"
        safetyLabel.text = "Safety Grade: \(city.gradeSafety)"
        toleranceLabel.text = "Tolerance Grade: \(city.gradeTolerance)"
        let cityUrl = URL(string: city.photo)
        do {
            let data = try Data(contentsOf: cityUrl!)
        cityImageView.image = UIImage(data: data)
        } catch {
            NSLog("Error getting images from City")
            return
                
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let city = city else { return }
        let savedCity = SavedCity(cityID: city.id, cityName: city.name, cityPhoto: city.photo)
        savedCitiesController.addSavedCity(savedCity: savedCity) { (loggedInUser, error) in
            if let error = error {
                DispatchQueue.main.async {
                    let alertController = UIAlertController(title: "Error saving city", message: "\(error)", preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(alertAction)
                    self.present(alertController, animated: true)
                }
            } else {
                let alertController = UIAlertController(title: "Success!", message: "City was saved.", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(alertAction)
                self.present(alertController, animated: true)
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

//
//  HomeViewController.swift
//  BestPlacesToLive
//
//  Created by Lambda_School_Loaner_148 on 8/22/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let networkController = NetworkingController()
    let transition = SlideInTransition()
    
    
    @IBOutlet weak var cityCollectionView: UICollectionView!
    @IBOutlet weak var incomeButton: UIButton!
    @IBOutlet weak var weatherButton: UIButton!
    @IBOutlet weak var schoolButton: UIButton!
    @IBOutlet weak var crimeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cityCollectionView.delegate = self
        self.cityCollectionView.dataSource = self
        
        setupCategoryButtons()
      
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.cityCollectionView.reloadData()
    }
    
    private func setupCategoryButtons() {
        incomeButton.setTitle("income", for: .normal)
        //  incomeButton.setBackgroundImage(UIImage(named: "Income"), for: .normal)
        incomeButton.layer.cornerRadius = 20.0
        
        
        weatherButton.setTitle("weather", for: .normal)
        //  weatherButton.setBackgroundImage(UIImage(named: "Weather"), for: .normal)
        weatherButton.layer.cornerRadius = 20.0
        
        schoolButton.setTitle("School", for: .normal)
        //    schoolButton.setBackgroundImage(UIImage(named: "School"), for: .normal)
        schoolButton.layer.cornerRadius = 20.0
        
        crimeButton.setTitle("Crime", for: .normal)
        //  crimeButton.setBackgroundImage(UIImage(named: "Crime"), for: .normal)
        crimeButton.layer.cornerRadius = weatherButton.frame.width / 2
    }
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        guard let menuTableViewController = storyboard?.instantiateViewController(withIdentifier: "MenuTableViewController") else { return }
        menuTableViewController.modalPresentationStyle = .overCurrentContext
        menuTableViewController.transitioningDelegate = self
        present(menuTableViewController, animated: true)
        
        
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

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return networkController.states.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCell", for: indexPath)
        guard let cityCell = cell as? CityCollectionViewCell else { return cell }
        let city = networkController.states[indexPath.row]
        
        
        cityCell.nameLabel.text = city.name
        cityCell.layer.cornerRadius = 20.0
        cityCell.layer.borderWidth = 1
        return cityCell
    }
}





extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}

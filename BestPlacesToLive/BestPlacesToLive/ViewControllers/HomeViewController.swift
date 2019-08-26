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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cityCollectionView.delegate = self
        
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
        return networkController.cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCell", for: indexPath) as? CityCollectionViewCell else { fatalError("City Collection Cell failed to return Data") }
        
        let city = networkController.cities[indexPath.row]
    
        
        
        cell.city = city
        
        
       
        
        
        
        return cell
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

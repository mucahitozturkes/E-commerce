//
//  catagoriListViewController.swift
//  E-commerce
//
//  Created by mücahit öztürk on 19.02.2024.
//

import UIKit

class catagoriListViewController: UIViewController {

    @IBOutlet weak var filtersButton: UIButton!
    @IBOutlet weak var updownButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var addsView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var adds = ["T-shirts", "Crop tops", "Blouses", "Shirts", "T-shirts", "Crop tops", "Blouses", "Shirts"]
    
    var helper: Helper!
    override func viewDidLoad() {
        super.viewDidLoad()
        helper = Helper()
       
        helper.configureView(addsView, CRadius: 0)
        helper.scaleButtonImage(filterButton, withImageNamed: "filter", scaleFloat: 0.6)
        helper.scaleButtonImage(updownButton, withImageNamed: "up-down", scaleFloat: 0.6)
        helper.scaleButtonImage(filtersButton, withImageNamed: "filters", scaleFloat: 0.6)
    }
    


}
extension catagoriListViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return adds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell", for: indexPath) as? CVCell
        
        cell?.addsButtons.titleLabel?.text = adds[indexPath.row]
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: collectionView.bounds.width, height: 30)
       }
    
}

class CVCell: UICollectionViewCell {
    @IBOutlet weak var addsButtons: UIButton!
    
}

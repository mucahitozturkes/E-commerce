//
//  HomeViewController.swift
//  E-commerce
//
//  Created by mücahit öztürk on 16.02.2024.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var photo = ["CV1-1", "CV1-2", "CV1-3", "CV1-1", "CV1-2", "CV1-3"]
    var photo2 = ["image1", "image2", "image1", "image2", "image1", "image2"]
 
    
    var helper: Helper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helper = Helper()
        
    }
    


}


extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
            
          
            return cell1
        } else if indexPath.row == 1 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! SecondTableViewCell
          
            return cell2
        } else if indexPath.row == 2 {
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as! ThirdTableViewCell
           
            return cell3
        } else if indexPath.row == 3 {
            let cell4 = tableView.dequeueReusableCell(withIdentifier: "Cell4", for: indexPath)
           
            return cell4
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 376 // İlk hücrenin yüksekliği
        } else if indexPath.row == 1{
            return 370 // İkinci hücrenin yüksekliği
        } else if indexPath.row == 2{
            return 370 // İkinci hücrenin yüksekliği
        } else if indexPath.row == 3{
            return 800 // İkinci hücrenin yüksekliği
        } else {
            return 481 // üçüncü hücrenin yüksekliği
        }
    }
    
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let secondTableViewCell = collectionView.superview?.superview as? SecondTableViewCell {
            return photo.count
        } else if let thirdTableViewCell = collectionView.superview?.superview as? ThirdTableViewCell {
            return photo.count
        }
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let SecondTableViewCell = collectionView.superview?.superview as? SecondTableViewCell {
            let accessV2 = SecondTableViewCell.collectionView1
            if (collectionView == accessV2) {
                let cell = accessV2?.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell
                cell?.images.image = UIImage(named: photo[indexPath.row])
                return cell!
            }
        } else if let thirdTableViewCell = collectionView.superview?.superview as? ThirdTableViewCell {
            let accessV3 = thirdTableViewCell.collectionView2
            if (collectionView == accessV3) {
                let cell3 = accessV3?.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for:indexPath) as? SecondCollectionViewCell
                cell3?.images.image = UIImage(named: photo2[indexPath.row])
                return cell3!
            }
        }
        return UICollectionViewCell()
    }
    
   
        

}

//
//  catagoriListViewController.swift
//  E-commerce
//
//  Created by mücahit öztürk on 19.02.2024.
//

import UIKit

class catagoriListViewController: UIViewController {

    @IBOutlet weak var sizeButton: UIButton!
    @IBOutlet weak var filtersButton: UIButton!
    @IBOutlet weak var updownButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var addsView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    
    var adds = ["T-shirts", "Crop tops", "Blouses", "Shirts", "T-shirts", "Crop tops", "Blouses", "Shirts"]
    var photos = ["CV1", "CV2", "CV1", "CV2", "CV1", "CV2", "CV1", "CV2"]
    
    var helper: Helper!
    override func viewDidLoad() {
        super.viewDidLoad()
        helper = Helper()
       
        helper.configureView(addsView, CRadius: 0)
        helper.scaleButtonImage(filterButton, withImageNamed: "filter", scaleFloat: 0.6)
        helper.scaleButtonImage(updownButton, withImageNamed: "up-down", scaleFloat: 0.6)
        helper.scaleButtonImage(filtersButton, withImageNamed: "filters", scaleFloat: 0.6)
    }
    
    @objc func showMiracle() {
        let slideVC = OverlayView()
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        self.present(slideVC, animated: true, completion: nil)
    }
    @objc func showMiracle2() {
        let slideVC = OverlayViewTwo()
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        self.present(slideVC, animated: true, completion: nil)
    }
    

    @IBAction func onButton(_sender: Any) {
        showMiracle()
    }

    @IBAction func sizeButtonPressed(_ sender: Any) {
        showMiracle2()
    }
}
extension catagoriListViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           if collectionView.tag == 0 {
               return adds.count
           } else if collectionView.tag == 1 {
               return photos.count
           }
           return 0
       }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            // Adds Collection View
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell", for: indexPath) as! CVCell
            cell.addsButtons.setTitle(adds[indexPath.row], for: .normal)
            return cell
        } else if collectionView.tag == 1 {
            // Photos Collection View
            let cellMain = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCVCell", for: indexPath) as! mainCVCell
            cellMain.imagesView.image = UIImage(named: photos[indexPath.row])
            return cellMain
        }
        fatalError("Unexpected collection view")
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if mainCollectionView.tag == 1 {
            let paddingSpace = CGFloat(16 * (2 + 1)) // CGFloat'e dönüştürüldü
            let availableWidth = collectionView.bounds.width - paddingSpace
            let widthPerItem = availableWidth / 2 // İki cell için genişlik
            
            return CGSize(width: widthPerItem, height: 280) // Height'i isteğinize göre ayarlayın.
        } else if collectionView.tag == 0 {
            return CGSize(width: collectionView.bounds.width, height: 30)
        }
        return CGSize(width: collectionView.bounds.width, height: 30)
        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 26, left: 16, bottom: 26, right: 16) // CollectionView kenar boşlukları
        }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           // Satırlar arası minimum boşluk
           return 26
       }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 16 // Cell'ler arası minimum boşluk
        }
        
    }
    


class CVCell: UICollectionViewCell {
    @IBOutlet weak var addsButtons: UIButton!
    
}
extension catagoriListViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
class mainCVCell: UICollectionViewCell {
    @IBOutlet weak var imagesView: UIImageView!
    
}

//
//  addCartViewController.swift
//  E-commerce
//
//  Created by mücahit öztürk on 21.02.2024.
//

import UIKit

class addCartViewController: UIViewController {
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var sizeButton: UIButton!
    @IBOutlet weak var addFavorite: UIButton!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    var photesBig = ["bigimage", "bigimage2", "bigimage", "bigimage2"]
    var helper = Helper()
    override func viewDidLoad() {
        super.viewDidLoad()
        helper.scaleBarButtonImage(shareButton, withImageNamed: "share", scaleFloat: 0.5)
        helper.configureButton(addFavorite)
        helper.scaleButtonImage(sizeButton, withImageNamed: "bottom", scaleFloat: 0.5)
        helper.scaleButtonImage(colorButton, withImageNamed: "bottom", scaleFloat: 0.5)
    }
    
    
    @objc func showMiracle2() {
        let slideVC = OverlayViewTwo()
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        self.present(slideVC, animated: true, completion: nil)
    }
    @IBAction func sizePopup(_ sender: UIButton) {
        showMiracle2()
    }
    
}
extension addCartViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photesBig.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bigCVCell", for: indexPath) as? bigCVCell
        cell!.imageBig.image = UIImage(named: photesBig[indexPath.row])
        return cell!
    }
    
    
}
class bigCVCell: UICollectionViewCell {
    
    @IBOutlet weak var imageBig: UIImageView!
}

extension addCartViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}

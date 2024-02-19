//
//  CollectionViewCell.swift
//  E-commerce
//
//  Created by mücahit öztürk on 18.02.2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var discountV: UIView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var images: UIImageView!
    var helper: Helper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        helper = Helper()
        helper.configureButton(heartButton)
        helper.configureView(discountV, CRadius: 12)
        
    }
}

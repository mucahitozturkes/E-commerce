//
//  ThirdTableViewCell.swift
//  E-commerce
//
//  Created by mücahit öztürk on 18.02.2024.
//

import UIKit

class ThirdTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView2: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        collectionView2.register(ThirdCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionView2")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

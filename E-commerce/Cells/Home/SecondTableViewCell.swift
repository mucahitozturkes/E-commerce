//
//  SecondTableViewCell.swift
//  E-commerce
//
//  Created by mücahit öztürk on 18.02.2024.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView1: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        collectionView1.register(SecondCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionView1")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

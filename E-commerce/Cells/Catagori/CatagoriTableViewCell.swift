//
//  CatagoriTableViewCell.swift
//  E-commerce
//
//  Created by mücahit öztürk on 18.02.2024.
//

import UIKit

class CatagoriTableViewCell: UITableViewCell {
    @IBOutlet weak var viewIndex1: UIView!
    var helper: Helper!
    override func awakeFromNib() {
        super.awakeFromNib()
        helper = Helper()
        helper.configureView(viewIndex1, CRadius: 12)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  SecondCatagoriTableViewCell.swift
//  E-commerce
//
//  Created by mücahit öztürk on 18.02.2024.
//

import UIKit

class SecondCatagoriTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCatagori: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var viewSecond: UIView!
    
  
   
    var helper: Helper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        helper = Helper()
        helper.configureView(viewSecond, CRadius: 12)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}

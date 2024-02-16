//
//  Helper.swift
//  E-commerce
//
//  Created by mücahit öztürk on 16.02.2024.
//

import UIKit


class Helper {
    /// UIView Blueprint
    func configureView(_ view: UIView) {
            // UIView'a gölge eklemek
            view.layer.shadowColor = UIColor.lightGray.cgColor
            view.layer.shadowOffset = CGSize(width: 0, height: 2)
            view.layer.shadowOpacity = 0.2
            view.layer.shadowRadius = 4.0

            // UIView'a köşe yuvarlama eklemek
            view.layer.cornerRadius = 6.0
            view.layer.masksToBounds = false // Bu satır, shadow ile ilgili görünümü etkilemektedir.
        }
    /// UIButton Blueprint
    func configureButton(_ button: UIButton) {
           // UIButton'a gölge eklemek
           button.layer.shadowColor = UIColor.black.cgColor
           button.layer.shadowOffset = CGSize(width: 0, height: 2)
           button.layer.shadowOpacity = 0.4
           button.layer.shadowRadius = 4.0

           // UIButton'a köşe yuvarlama eklemek
           button.layer.cornerRadius = 10.0
           button.layer.masksToBounds = false // Bu satır, shadow ile ilgili görünümü etkilemektedir.
       }
    
}

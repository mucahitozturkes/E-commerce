//
//  Helper.swift
//  E-commerce
//
//  Created by mücahit öztürk on 16.02.2024.
//

import UIKit


class Helper {
    /// UIView Blueprint
    func configureView(_ view: UIView, CRadius: CGFloat) {
            // UIView'a gölge eklemek
            view.layer.shadowColor = UIColor.lightGray.cgColor
            view.layer.shadowOffset = CGSize(width: 0, height: 2)
            view.layer.shadowOpacity = 0.2
            view.layer.shadowRadius = 4.0

            // UIView'a köşe yuvarlama eklemek
            view.layer.cornerRadius = CRadius
            view.layer.masksToBounds = false // Bu satır, shadow ile ilgili görünümü etkilemektedir.
        }
    /// UIButton Blueprint
    func configureButton(_ button: UIButton) {
           // UIButton'a gölge eklemek
           button.layer.shadowColor = UIColor.lightGray.cgColor
           button.layer.shadowOffset = CGSize(width: 0, height: 2)
           button.layer.shadowOpacity = 0.4
           button.layer.shadowRadius = 4.0

           // UIButton'a köşe yuvarlama eklemek
           button.layer.cornerRadius = 10.0
           button.layer.masksToBounds = false // Bu satır, shadow ile ilgili görünümü etkilemektedir.
       }
    /// buton içi resim scale Blueprint
    func scaleButtonImage(_ button: UIButton, withImageNamed imageName: String, scaleFloat: CGFloat) {
        if let image = UIImage(named: imageName)?.resized(withScale: scaleFloat) {
            button.setImage(image, for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
        }
        
    }
}
// UIImage'ı belirli bir ölçekte yeniden boyutlandırmak
extension UIImage {
    func resized(withScale scale: CGFloat) -> UIImage? {
        let newSize = CGSize(width: size.width * scale, height: size.height * scale)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: newSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

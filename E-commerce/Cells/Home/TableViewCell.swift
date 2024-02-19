//
//  TableViewCell.swift
//  E-commerce
//
//  Created by mücahit öztürk on 18.02.2024.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageSlider: UIImageView!
    var photoSlider: [String] = ["main", "main2", "main3", "main4", "main5"]
    var currentIndex = 0
    var timer: Timer?
    
    override func awakeFromNib() {
           super.awakeFromNib()

           // Set up a timer to change the image every 1 second
           timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
       }

       @objc func changeImage() {
           // Increment the index or reset to 0 if it exceeds the array count
           currentIndex = (currentIndex + 1) % photoSlider.count
           imageSlider.image = UIImage(named: photoSlider[currentIndex])
       }

       // Ensure the timer is invalidated when the cell is reused
       override func prepareForReuse() {
           super.prepareForReuse()
           timer?.invalidate()
       }
    

}

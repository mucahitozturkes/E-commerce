//
//  ShopViewController.swift
//  E-commerce
//
//  Created by mücahit öztürk on 18.02.2024.
//

import UIKit

class ShopViewController: UIViewController {

    @IBOutlet weak var kidsLine: UIView!
    @IBOutlet weak var menLine: UIView!
    @IBOutlet weak var womenLine: UIView!
    @IBOutlet weak var kidsButton: UIButton!
    @IBOutlet weak var manButton: UIButton!
    @IBOutlet weak var womenButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var photos: [String] = ["img1", "img2", "img3", "img4", "img1", "img2", "img3", "img4"]
    var titles: [String] = ["New", "Clothes", "Shoes", "Accesories", "New", "Clothes", "Shoes", "Accesories"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
      
    }
    
    @IBAction func womenButtonPRessed(_ sender: UIButton) {
        updateLinesAndLabels(selectedLine: womenLine, selectedButton: womenButton)
    }
    @IBAction func menButtonPRessed(_ sender: UIButton) {
        updateLinesAndLabels(selectedLine: menLine, selectedButton: manButton)
    }
    @IBAction func kidsButtonPRessed(_ sender: UIButton) {
        updateLinesAndLabels(selectedLine: kidsLine, selectedButton: kidsButton)
    }
    
    private func updateLinesAndLabels(selectedLine: UIView, selectedButton: UIButton) {
        // Reset all lines to white
        kidsLine.backgroundColor = UIColor.white
        menLine.backgroundColor = UIColor.white
        womenLine.backgroundColor = UIColor.white

        // Reset all buttons to thin font
        kidsButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .light)
        manButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .light)
        womenButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .light)

        // Set the selected line to red and button font to bold
        selectedLine.backgroundColor = UIColor.red
        selectedButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    

}

extension ShopViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
          // Assuming you have 2 sections
          return 2
      }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 0
        case 1:
            return 8 // Adjust the number of rows as needed for section 1
        default:
            return 0
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
               // Dequeue and configure the cell for index 0
               let cell = tableView.dequeueReusableCell(withIdentifier: "CatagoriTableViewCell", for: indexPath) as! CatagoriTableViewCell
               // Configure the cell for index 0
               return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCatagoriTableViewCell", for: indexPath) as? SecondCatagoriTableViewCell
            
            cell!.labelText?.text = titles[indexPath.row]
            cell!.imageCatagori?.image = UIImage(named: photos[indexPath.row])
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
      
    }

    
}

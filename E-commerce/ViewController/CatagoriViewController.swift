//
//  CatagoriViewController.swift
//  E-commerce
//
//  Created by mücahit öztürk on 19.02.2024.
//

import UIKit

class CatagoriViewController: UIViewController {
    var titleList = ["Tops", "Shirts & Blouses", "Cardigans & Sweaters", "Knitwear", "Blazers", "Outewear", "Pants", "Jeans", "Shorts", "Skirts", "Dresses", "Tops", "Shirts & Blouses", "Cardigans & Sweaters", "Knitwear", "Blazers", "Outewear", "Pants", "Jeans", "Shorts", "Skirts", "Dresses"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

   

}
extension CatagoriViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catagoriCell", for: indexPath) as? catagoriCell
        
        cell!.titleLabels?.text = titleList[indexPath.row]
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
      
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
class catagoriCell: UITableViewCell {
    @IBOutlet weak var titleLabels: UILabel!
    
}

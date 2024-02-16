//
//  ForgotPasswordViewController.swift
//  E-commerce
//
//  Created by mücahit öztürk on 16.02.2024.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var buttonView1: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    var helper: Helper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helper = Helper()
        
        buttonView1.layer.borderWidth = 1.0
        buttonView1.layer.cornerRadius = 8.0 // You can adjust this value based on your preference
        buttonView1.layer.borderColor = UIColor.red.cgColor
    

        helper.configureButton(loginButton)
       
        // UITapGestureRecognizer'ı ekleyerek boş bir yere tıklanınca klavyenin kapanmasını sağla
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    // Boş bir yere dokunulduğunda klavyenin kapanmasını sağlayan metod
       @objc func dismissKeyboard() {
           view.endEditing(true)
       }
    

}

//
//  LoginViewController.swift
//  E-commerce
//
//  Created by mücahit öztürk on 16.02.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButtton: UIButton!
 
    @IBOutlet weak var buttonView2: UIView!
    @IBOutlet weak var buttonView1: UIView!
   
    @IBOutlet weak var tickImage2: UIImageView!
    @IBOutlet weak var tickImage: UIImageView!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
   
    var helper: Helper!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        helper = Helper()
        
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
        
        // gölge, köşe
        helper.configureView(buttonView1, CRadius: 6)
        helper.configureView(buttonView2, CRadius: 6)
        
        
        // gölge, buton
        helper.configureButton(googleButtton)
        helper.configureButton(facebookButton)
        helper.configureButton(loginButton)
        
        // buton resmi boyut ayarı
        helper.scaleButtonImage(googleButtton, withImageNamed: "google", scaleFloat: 0.5)
        helper.scaleButtonImage(facebookButton, withImageNamed: "facebook", scaleFloat: 0.5)
        
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
// tic göster/gizle
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Text editing başladığında image göster
        if textField == emailTextfield {
            tickImage.isHidden = false
        } else if textField == passwordTextfield {
            tickImage2.isHidden = false
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // Text editing bittiğinde image gizle
        if textField == emailTextfield {
            tickImage.isHidden = true
        } else if textField == passwordTextfield {
            tickImage2.isHidden = true
        }
    }
}

//
//  ViewController.swift
//  E-commerce
//
//  Created by mücahit öztürk on 16.02.2024.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var buttonView3: UIView!
    @IBOutlet weak var buttonView2: UIView!
    @IBOutlet weak var buttonView1: UIView!
    @IBOutlet weak var tickImage3: UIImageView!
    @IBOutlet weak var tickImage2: UIImageView!
    @IBOutlet weak var tickImage: UIImageView!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var nameTextfield: UITextField!
 
    var helper: Helper!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        helper = Helper()
        
        nameTextfield.delegate = self
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
        
        // gölge, köşe
        helper.configureView(buttonView1)
        helper.configureView(buttonView2)
        helper.configureView(buttonView3)
        
        }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Text editing başladığında image göster
        if textField == nameTextfield {
            tickImage.isHidden = false
        } else if textField == emailTextfield {
            tickImage2.isHidden = false
        } else if textField == passwordTextfield {
            tickImage3.isHidden = false
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // Text editing bittiğinde image gizle
        if textField == nameTextfield {
            tickImage.isHidden = true
        } else if textField == emailTextfield {
            tickImage2.isHidden = true
        } else if textField == passwordTextfield {
            tickImage3.isHidden = true
        }
    }
}

//
//  SignInViewController.swift
//  news-app
//
//  Created by hungvn on 3/28/24.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    @IBAction func emaiChanged(_ sender: Any) {
        emailLabel.isHidden = true
        passwordLabel.isHidden = true
    }
    
    @IBAction func passwordChanged(_ sender: Any) {
        passwordTextField.enablePasswordToggle()
        signInButton.backgroundColor = UIColor.black
        signInButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    @IBAction func regisButtonTouchUp(_ sender: Any) {
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.backgroundColor = Constant.colorGray
        signInButton.layer.cornerRadius = 15
        signInButton.layer.borderColor = Constant.borderColor
        emailLabel.isHidden = false
        emailErrorLabel.isHidden = true
        passwordLabel.isHidden = false
        passwordErrorLabel.isHidden = true
        passwordTextField.useUnderline()
        emailTextField.useUnderline()
                
    }
}


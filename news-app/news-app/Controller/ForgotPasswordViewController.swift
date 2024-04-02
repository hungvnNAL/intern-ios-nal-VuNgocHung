//
//  ForgotPasswordViewController.swift
//  news-app
//
//  Created by hungvn on 3/28/24.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resendStack: UIStackView!
    @IBOutlet weak var resetButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.useUnderline()
        emailLabel.isHidden = true
        resetButton.backgroundColor = Constant.colorGray
        resetButton.layer.cornerRadius = 15
        resetButton.layer.borderColor = Constant.borderColor
        resetButton.setTitleColor(.white, for: .normal)
        resendStack.isHidden = true
        resetButton.isEnabled = false
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "ic_back"), style: .done, target: self, action:#selector(backButtonTapped))
        navigationController?.navigationBar.tintColor = UIColor.black
        
    }
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func emailTextFieldChanged(_ sender: Any) {
        emailLabel.isHidden = false
        resetButton.layer.borderColor = Constant.borderColor
        resetButton.layer.backgroundColor = UIColor.black.cgColor
        resetButton.isEnabled = true
    }
    
    @IBAction func resetButton(_ sender: Any) {
        resendStack.isHidden = false
        showAlert(title: "Notification", message: "Email sent. Please check your email to reset your password")
    }
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil ))
        self.present(alert, animated: true, completion: nil)
    }
}

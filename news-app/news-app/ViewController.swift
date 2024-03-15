//
//  ViewController.swift
//  news-app
//
//  Created by hungvn on 3/5/24.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var signupButton: UIButton!
    
    func singleLine(textField : UITextField) {
        
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 2, width: textField.frame.width, height: 2)
        
        bottomLine.backgroundColor = CGColor.init(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
        
        textField.borderStyle = .none
        
        textField.layer.addSublayer(bottomLine)
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil ))

        self.present(alert, animated: true, completion: nil)
        }
    
    
    @IBAction func labelemailShowup(_ sender: UITextField) {
        emailLabel.isHidden = false
    }
    
    
    @IBAction func passwordEditting(_ sender: Any) {
        passwordLabel.isHidden = false
        signupButton.isEnabled = true
        signupButton.layer.cornerRadius = 15
        signupButton.layer.borderColor = UIColor.black.cgColor
        signupButton.layer.backgroundColor = UIColor.black.cgColor
        signupButton.tintColor = .white
    }
    
    
    @IBAction func signupButtonPressed(_ sender: UIButton) {
        let emailText = emailTextField.text ?? ""
        if isValidEmail(emailText){
            print("email is valid")
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "home_topNewsViewController") as! home_topNewsViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            print("email is not valid")
            showAlert(title: "Error", message: "Check your email is not valid")
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        singleLine(textField: emailTextField)
        singleLine(textField: passwordTextField)
    
        emailLabel.isHidden = true
        passwordLabel.isHidden = true
        
        passwordTextField.enablePasswordToggle()
        
        signupButton.isEnabled = false
        signupButton.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        signupButton.layer.cornerRadius = 15
        signupButton.layer.borderColor = UIColor.black.cgColor
        
    }
}

extension UITextField {
fileprivate func setPasswordToggleImage(_ button: UIButton) {
    if(isSecureTextEntry){
        button.setImage(UIImage(named: "ic_password_invisible"), for: .normal)
    }else{
        button.setImage(UIImage(named: "ic_password_visible"), for: .normal)

    }
}

func enablePasswordToggle(){
    let button = UIButton(type: .custom)
    setPasswordToggleImage(button)
    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
    button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
    button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
    self.rightView = button
    self.rightViewMode = .always
}
@IBAction func togglePasswordView(_ sender: Any) {
    self.isSecureTextEntry = !self.isSecureTextEntry
    setPasswordToggleImage(sender as! UIButton)
}

}

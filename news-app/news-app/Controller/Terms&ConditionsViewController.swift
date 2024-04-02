//
//  Terms&ConditionsViewController.swift
//  news-app
//
//  Created by hungvn on 3/28/24.
//

import UIKit

class TermsAndConditionsViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        let customBackButton = UIBarButtonItem.init(image: UIImage(named: "ic_back"), style: .done, target: self, action:#selector(backButtonTapped))
        let secondButton = UIBarButtonItem.init(title: "Terms & Conditions", style: .done, target: self, action: .none)
        navigationItem.leftBarButtonItems = [customBackButton, secondButton]
        navigationController?.navigationBar.tintColor = UIColor.black

    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

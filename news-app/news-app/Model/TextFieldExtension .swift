//
//  TextFieldExtension .swift
//  news-app
//
//  Created by hungvn on 3/28/24.
//

import Foundation
import UIKit

extension UITextField {
    
    func useUnderline() {
        let borderView = UIView()
        borderView.translatesAutoresizingMaskIntoConstraints = false
        borderView.backgroundColor = Constant.colorGray
        self.addSubview(borderView)
        
        NSLayoutConstraint.activate([
            borderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            borderView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            borderView.heightAnchor.constraint(equalToConstant: 2.0)
        ])
    }
}

extension UIViewController {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) 
        super.touchesBegan(touches, with: event)
    }
}


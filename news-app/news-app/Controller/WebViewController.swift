//
//  WebViewController.swift
//  news-app
//
//  Created by hungvn on 4/1/24.
//

import UIKit
import WebKit
class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://www.youtube.com/watch?v=WSI_LS3Yq8I")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    
    
}

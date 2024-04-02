//
//  SettingViewController.swift
//  news-app
//
//  Created by hungvn on 4/1/24.
//

import UIKit

class SettingViewController: UIViewController {
    let nib = UINib(nibName: "SettingTableViewCell", bundle: .main)

    @IBOutlet weak var settingTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.register(nib, forCellReuseIdentifier: "cell")

    }
}
extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingTableViewCell
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    
    
    
}

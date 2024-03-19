//
//  HometopnewsViewController.swift
//  news-app
//
//  Created by hungvn on 3/19/24.
//

import UIKit

class HomeTopNewsViewController: UIViewController {

    let identifier = "HometopnewsViewController"
    
    @IBOutlet weak var containerCollectionView: UICollectionView!
    
    @IBOutlet weak var postlistTableView: UITableView!
    let nib = UINib(nibName: "ContainerCollectionViewCell", bundle: .main)
    let container: [String] = ["For you", "Top", "World", "Politics"]
    override func viewDidLoad() {
        super.viewDidLoad()

        containerCollectionView.delegate = self
        containerCollectionView.dataSource = self
        
        containerCollectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        
        postlistTableView.delegate = self
        postlistTableView.dataSource = self
        postlistTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    

}
extension HomeTopNewsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return container.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = containerCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ContainerCollectionViewCell
        
        cell.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        cell.layer.cornerRadius = 15
        cell.layer.borderColor = UIColor.black.cgColor

        cell.titleLabel.text = container[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           
        }
    
    
}
extension HomeTopNewsViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postlistTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.systemPink
        return cell
    }
    
    
}

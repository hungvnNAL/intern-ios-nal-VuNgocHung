//
//  HometopnewsViewController.swift
//  news-app
//
//  Created by hungvn on 3/19/24.
//

import UIKit

class HometopnewsViewController: UIViewController {

    @IBOutlet weak var containerCollectionView: UICollectionView!
    
    let nib = UINib(nibName: "ContainerCollectionViewCell", bundle: .main)
    let container: [String] = ["For you", "Top", "World", "Politics"]
    override func viewDidLoad() {
        super.viewDidLoad()

        containerCollectionView.delegate = self
        containerCollectionView.dataSource = self
        
        containerCollectionView.register(nib, forCellWithReuseIdentifier: "Cell")
    }
    

}
extension HometopnewsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
    
    
}

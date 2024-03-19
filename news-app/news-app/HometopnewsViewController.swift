//
//  HometopnewsViewController.swift
//  news-app
//
//  Created by hungvn on 3/19/24.
//

import UIKit

class HometopnewsViewController: UIViewController {

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    let nib = UINib(nibName: "CategorieCollectionViewCell", bundle: .main)
    let container: [String] = ["For You", "Top", "World"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categoriesCollectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
    }
    
}
extension HometopnewsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return container.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CategorieCollectionViewCell
        cell.contentView.layoutMargins = UIEdgeInsets(top: 4, left: 15, bottom: 4, right: 15)
        cell.layer.backgroundColor = UIColor.red.cgColor
        cell.titleLabel.text = container[indexPath.row]
        
        return cell
    }
    
    
}

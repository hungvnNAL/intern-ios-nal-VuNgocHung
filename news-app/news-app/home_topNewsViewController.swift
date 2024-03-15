//
//  home_topNewsViewController.swift
//  news-app
//
//  Created by hungvn on 3/13/24.
//

import UIKit

class home_topNewsViewController: UIViewController {
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
//    static let identifier = "categoriesCollectionView"
    
    let categori = ["car 1", "car 2", "car 3"]
    
    @IBOutlet weak var postListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        
        
    
    }


}
extension home_topNewsViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return categori.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath)
                
        let category = categori[indexPath.item]
        cell.backgroundColor = .systemBlue
                return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Customize cell size here
        return CGSize(width: collectionView.frame.width / 2 - 10, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

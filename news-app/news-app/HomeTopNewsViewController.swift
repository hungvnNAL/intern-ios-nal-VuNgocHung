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
    
    let nibforTableViewCell = UINib(nibName: "PostListsTableViewCell", bundle: .main)
    
    let container: [String] = ["For you ", "Top", "World", "Politics", "For you", "Top", "World", "Politics", "For you", "Top", "World", "Politics", "For you", "Top", "World", "Politics"]
    var itemSelected : IndexPath?
    
    var models: [Model] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerCollectionView.delegate = self
        containerCollectionView.dataSource = self
        
        containerCollectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        
        postlistTableView.delegate = self
        postlistTableView.dataSource = self
        postlistTableView.register(nibforTableViewCell, forCellReuseIdentifier: "cell")
        
        fetchDataAndUpdateUI()
    }
    func fetchDataAndUpdateUI(){
        APICaller.shared.fetchData{ [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchModels):
                    self?.models = fetchModels
                    self?.postlistTableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
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
        cell.titleLabel.text = container[indexPath.item]
        
        if indexPath == itemSelected {
            cell.backgroundColor = .black
            cell.titleLabel.textColor = .white
        } else {
            cell.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)// Trở về màu mặc định cho các cell khác
            cell.titleLabel.textColor = .black
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        itemSelected = indexPath
        containerCollectionView.reloadData()
    }

    
    
}
extension HomeTopNewsViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postlistTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostListsTableViewCell
        let model = models[indexPath.row]
        cell.textLabel?.text = model.title
        cell.authorLabel.text = "HungVu"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

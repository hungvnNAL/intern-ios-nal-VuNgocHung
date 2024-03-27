//
//  HometopnewsViewController.swift
//  news-app
//
//  Created by hungvn on 3/19/24.
//
import Kingfisher
import UIKit

class HomeTopNewsViewController: UIViewController {
    
    let identifier = "HometopnewsViewController"
    
    @IBOutlet weak var containerCollectionView: UICollectionView!
    
    @IBOutlet weak var postlistTableView: UITableView!
    let nib = UINib(nibName: "ContainerCollectionViewCell", bundle: .main)
    
    let nibforTableViewCell = UINib(nibName: "PostListsTableViewCell", bundle: .main)

    var itemSelected : IndexPath?
    var newsItems: [NewsItem] = []
    let listCategories = categories
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemSelected = IndexPath(row: 0, section: 0)
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
                    self?.newsItems = fetchModels
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
        return listCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = containerCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ContainerCollectionViewCell
        cell.backgroundColor = Constant.colorGray
        cell.layer.cornerRadius = 15
        cell.layer.borderColor = Constant.borderColor
        cell.titleLabel.text = listCategories[indexPath.row].title
        if indexPath.row == itemSelected?.row  {
            cell.backgroundColor = .black
            cell.titleLabel.textColor = .white
        } else {
            cell.backgroundColor = Constant.colorGray
            cell.titleLabel.textColor = .black
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        itemSelected = indexPath
        APICaller.shared.indexLink = itemSelected 
        fetchDataAndUpdateUI()
        containerCollectionView.reloadData()
    }
}
extension HomeTopNewsViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postlistTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostListsTableViewCell
        let news = newsItems[indexPath.row]
        cell.titleLabel.text = news.title
        cell.timeLabel.text = DateFormatter().convertStringDateFormat(dateString: news.pubDate)
        cell.ThumbnailImage.kf.setImage(with: news.imageUrl)
        
        return cell
    }
}


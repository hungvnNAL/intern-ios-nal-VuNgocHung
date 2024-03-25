//
//  PostListsTableViewCell.swift
//  news-app
//
//  Created by hungvn on 3/19/24.
//

import UIKit


class PostListsTableViewCell: UITableViewCell {

    @IBOutlet weak var imageTableView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var containerLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        authorLabel.textColor = .blue
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

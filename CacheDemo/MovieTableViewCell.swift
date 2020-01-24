//
//  MovieTableViewCell.swift
//  CacheDemo
//
//  Created by SHIH-YING PAN on 2020/1/24.
//  Copyright © 2020 SHIH-YING PAN. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    var feed: Feed!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func update(with feed: Feed) {
        self.feed = feed
        nameLabel.text = feed.name
        photoImageView.image = UIImage(systemName: "film")
        NetworkController.shared.fetchImage(url: feed.artworkUrl100) {[weak self] (image) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if feed.id == self.feed.id {
                    self.photoImageView.image = image
                }
            }
        }
    }
    
}

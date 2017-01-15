//
//  GitHubRepositoryDetailViewCell.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/15/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import UIKit

class GitHubRepositoryDetailViewCell: UITableViewCell {
    static let cellIdentifier = String(describing: GitHubRepositoryDetailViewCell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(_ text: String?, icon: UIImage?) {
        self.textLabel?.text = text
        self.imageView?.image = icon
    }
}

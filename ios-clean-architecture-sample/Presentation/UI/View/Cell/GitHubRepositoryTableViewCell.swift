//
//  GitHubRepositoryTableViewCell.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import UIKit

class GitHubRepositoryTableViewCell: UITableViewCell {
    static let cellIdentifier = String(describing: GitHubRepositoryTableViewCell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(_ model: GitHubRepositoryModel) {
        self.textLabel?.text = model.fullName
    }
}

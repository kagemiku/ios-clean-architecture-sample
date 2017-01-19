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

    func configure(_ model: GitHubRepositoryModel) {
        self.textLabel?.text = model.fullName
    }
}

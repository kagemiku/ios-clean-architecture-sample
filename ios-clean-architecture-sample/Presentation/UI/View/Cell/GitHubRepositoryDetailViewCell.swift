//
//  GitHubRepositoryDetailViewCell.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/15/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import UIKit

class GitHubRepositoryDetailViewCell: UITableViewCell {
    func configure(text: String?, icon: UIImage?) {
        self.textLabel?.text = text
        self.imageView?.image = icon
    }
}

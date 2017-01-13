//
//  GitHubRepositoryWireframe.swift
//  ios-clean-architecture-sample
//
//  Created by Akira Fukunaga on 1/12/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import UIKit

final class GitHubRepositoryWireframe {
    fileprivate weak var viewController: GitHubRepositoryTableViewController?

    init(viewController: GitHubRepositoryTableViewController) {
        self.viewController = viewController
    }

    func showDetail(repositoryModel: GitHubRepositoryModel) {
        if let nextViewController = GitHubRepositoryDetailViewControllerBuilder.build() as? GitHubRepositoryDetailViewController {
            nextViewController.setRepositoryModel(repositoryModel)
            self.viewController?.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}

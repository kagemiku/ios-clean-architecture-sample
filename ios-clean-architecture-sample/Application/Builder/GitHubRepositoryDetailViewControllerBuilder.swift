//
//  GitHubRepositoryDetailViewControllerBuilder.swift
//  ios-clean-architecture-sample
//
//  Created by Akira Fukunaga on 1/10/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import UIKit

final class GitHubRepositoryDetailViewControllerBuilder: ViewControllerBuilder {
    typealias ViewController = GitHubRepositoryDetailViewController

    static func build() -> ViewController {
        let viewController = GitHubRepositoryDetailViewController()

        return viewController
    }
}

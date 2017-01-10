//
//  GitHubRepositoryDetailViewControllerBuilder.swift
//  ios-clean-architecture-sample
//
//  Created by Akira Fukunaga on 1/10/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import UIKit

final class GitHubRepositoryDetailViewControllerBuilder {
    static func build() -> UIViewController {
        let viewController = GitHubRepositoryDetailViewController()

        return viewController
    }
}

//
//  GitHubRepositorySearchBuilder.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/7/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import UIKit

final class GitHubRepositoryTableViewControllerBuilder {
    static func build() -> UIViewController {
        let dataStore      = GitHubRepositoryDataStoreImpl()
        let repository     = GitHubRepositoryRepositoryImpl(dataStore: dataStore)
        let useCase        = GitHubRepositoryUseCaseImpl(repository: repository)
        let presenter      = GitHubRepositoryPresenterImpl(useCase: useCase)
        let viewController = GitHubRepositoryTableViewController()

        dataStore.inject(repository: repository)
        repository.inject(useCase: useCase)
        useCase.inject(presenter: presenter)
        presenter.inject(viewController: viewController)
        viewController.inject(presenter: presenter)

        return viewController
    }
}

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
        let dataStore = GitHubRepositoryDataStore()
        let repository = GitHubRepositoryRepository(dataStore: dataStore)
        let useCase = GitHubRepositoryUseCase(repository: repository)
        let presenter = GitHubRepositoryPresenter(useCase: useCase)
        let viewController = GitHubRepositoryTableViewController()

        dataStore.inject(repository: repository)
        repository.inject(useCase: useCase)
        useCase.inject(presenter: presenter)
        presenter.inject(viewController: viewController)
        viewController.inject(presenter: presenter)

        return viewController
    }
}

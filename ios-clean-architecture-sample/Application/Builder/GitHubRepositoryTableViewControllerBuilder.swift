//
//  GitHubRepositorySearchBuilder.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/7/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import UIKit

struct GitHubRepositoryTableViewControllerBuilder: ViewControllerBuilder {
    typealias ViewController = GitHubRepositoryTableViewController

    static func build() -> ViewController {
        let viewController = GitHubRepositoryTableViewController()
        let wireframe      = GitHubRepositoryWireframe(viewController: viewController)
        let dataStore      = GitHubRepositoryDataStoreImpl()
        let repository     = GitHubRepositoryRepositoryImpl(dataStore: dataStore)
        let useCase        = GitHubRepositoryUseCaseImpl(repository: repository)
        let presenter      = GitHubRepositoryPresenterImpl(useCase: useCase, wireframe: wireframe)

        dataStore.inject(repository: repository)
        repository.inject(useCase: useCase)
        useCase.inject(presenter: presenter)
        presenter.inject(viewController: viewController)
        viewController.inject(presenter: presenter)

        return viewController
    }
}

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
        let dataStore      = GitHubRepositoryDetailDataStoreImpl()
        let repository     = GitHubRepositoryDetailRepositoryImpl(dataStore: dataStore)
        let useCase        = GitHubRepositoryDetailUseCaseImpl(repository: repository)
        let presenter      = GitHubRepositoryDetailPresenterImpl(useCase: useCase)

        dataStore.inject(repository: repository)
        repository.inject(useCase: useCase)
        useCase.inject(presenter: presenter)
        presenter.inject(viewController: viewController)
        viewController.inject(presenter: presenter)

        return viewController
    }
}

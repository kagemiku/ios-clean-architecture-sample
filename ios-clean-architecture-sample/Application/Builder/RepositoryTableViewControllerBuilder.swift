//
//  RepositorySearchBuilder.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/7/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import UIKit

final class RepositoryTableViewControllerBuilder {
    static func build() -> UIViewController {
        let dataStore = RepositoryDataStore()
        let repository = RepositoryRepository(dataStore: dataStore)
        let useCase = RepositoryUseCase(repository: repository)
        let presenter = RepositoryPresenter(useCase: useCase)
        let viewController = RepositoryTableViewController()

        dataStore.inject(repository: repository)
        repository.inject(useCase: useCase)
        useCase.inject(presenter: presenter)
        presenter.inject(viewController: viewController)
        viewController.inject(presenter: presenter)

        return viewController
    }
}

//
//  RepositoryPresenter.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol RepositoryPresenterInputDelegate: class {
    func setRepositoriesModel(_ repositoriesModel: RepositoriesModel)
}

class RepositoryPresenter {
    fileprivate let useCase: RepositoryUseCase
    fileprivate weak var viewController: RepositoryPresenterInputDelegate?

    init(useCase: RepositoryUseCase) {
        self.useCase = useCase
    }

    func inject(viewController: RepositoryPresenterInputDelegate) {
        self.viewController = viewController
    }

    func loadRepositories(repositoryName: String) {
        useCase.loadRepositories(repositoryName: repositoryName)
    }
}

extension RepositoryPresenter: RepositoryUseCaseInputDelegate {
    func useCase(_ useCase: RepositoryUseCase, didLoadRepositories repositories: RepositoriesModel) {
        self.viewController?.setRepositoriesModel(repositories)
    }
}

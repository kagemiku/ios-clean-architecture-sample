//
//  GitHubGitHubRepositoryPresenter.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol GitHubRepositoryPresenterInputDelegate: class {
    func setRepositoriesModel(_ repositoriesModel: RepositoriesModel)
}

class GitHubRepositoryPresenter {
    fileprivate let useCase: GitHubRepositoryUseCase
    fileprivate weak var viewController: GitHubRepositoryPresenterInputDelegate?

    init(useCase: GitHubRepositoryUseCase) {
        self.useCase = useCase
    }

    func inject(viewController: GitHubRepositoryPresenterInputDelegate) {
        self.viewController = viewController
    }

    func loadRepositories(repositoryName: String) {
        useCase.loadRepositories(repositoryName: repositoryName)
    }
}

extension GitHubRepositoryPresenter: GitHubRepositoryUseCaseInputDelegate {
    func useCase(_ useCase: GitHubRepositoryUseCase, didLoadRepositories repositories: RepositoriesModel) {
        self.viewController?.setRepositoriesModel(repositories)
    }
}

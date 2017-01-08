//
//  GitHubGitHubRepositoryPresenter.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol GitHubRepositoryPresenter: class {
    func loadRepositories(repositoryName: String)
}

protocol GitHubRepositoryPresenterInput: class {
    func setRepositoriesModel(_ repositoriesModel: RepositoriesModel)
}

class GitHubRepositoryPresenterImpl: GitHubRepositoryPresenter {
    fileprivate let useCase: GitHubRepositoryUseCase
    fileprivate weak var viewController: GitHubRepositoryPresenterInput?

    init(useCase: GitHubRepositoryUseCase) {
        self.useCase = useCase
    }

    func inject(viewController: GitHubRepositoryPresenterInput) {
        self.viewController = viewController
    }

    func loadRepositories(repositoryName: String) {
        useCase.loadRepositories(repositoryName: repositoryName)
    }
}

extension GitHubRepositoryPresenterImpl: GitHubRepositoryUseCasePresentationInput {
    func useCase(_ useCase: GitHubRepositoryUseCase, didLoadRepositories repositories: RepositoriesModel) {
        self.viewController?.setRepositoriesModel(repositories)
    }
}

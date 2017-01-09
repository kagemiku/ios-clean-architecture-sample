//
//  GitHubGitHubRepositoryPresenter.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol GitHubRepositoryPresenter: class {
    func didUpdateRepositorySearchBarText(_ text: String?)
}

protocol GitHubRepositoryPresenterInput: class {
    func setRepositoriesModel(_ repositoriesModel: GitHubRepositoriesModel)
    func showLoadingView()
    func hideLoadingView()
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

    func didUpdateRepositorySearchBarText(_ text: String?) {
        self.viewController?.showLoadingView()
        self.useCase.searchRepositories(repositoryName: text)
    }
}

extension GitHubRepositoryPresenterImpl: GitHubRepositoryUseCasePresentationInput {
    func useCase(_ useCase: GitHubRepositoryUseCase, didSearchRepositories repositories: GitHubRepositoriesModel) {
        self.viewController?.setRepositoriesModel(repositories)
        self.viewController?.hideLoadingView()
    }
}

//
//  GitHubRepositoryUseCase.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol GitHubRepositoryUseCase: class {
    func searchRepositories(repositoryName: String?)
    func repository(_ repository: GitHubRepositoryUseCaseDataInput, didSearchRepositories repositories: GitHubRepositoriesEntity)
}

protocol GitHubRepositoryUseCasePresentationInput: class {
    func useCase(_ useCase: GitHubRepositoryUseCase, didSearchRepositories repositories: GitHubRepositoriesModel)
}

protocol GitHubRepositoryUseCaseDataInput: class {
    func searchRepositories(repositoryName: String)
}

final class GitHubRepositoryUseCaseImpl: GitHubRepositoryUseCase {
    fileprivate let repository: GitHubRepositoryUseCaseDataInput
    fileprivate weak var presenter: GitHubRepositoryUseCasePresentationInput?

    init(repository: GitHubRepositoryUseCaseDataInput) {
        self.repository = repository
    }

    func inject(presenter: GitHubRepositoryUseCasePresentationInput) {
        self.presenter = presenter
    }

    func searchRepositories(repositoryName: String?) {
        if let name = repositoryName, !name.isEmpty {
            self.repository.searchRepositories(repositoryName: name)
        } else {
            self.presenter?.useCase(self, didSearchRepositories: GitHubRepositoriesModel())
        }
    }

    func repository(_ repository: GitHubRepositoryUseCaseDataInput, didSearchRepositories repositories: GitHubRepositoriesEntity) {
        let repositoriesModel = GitHubRepositoriesTranslator.translate(repositories)
        self.presenter?.useCase(self, didSearchRepositories: repositoriesModel)
    }
}

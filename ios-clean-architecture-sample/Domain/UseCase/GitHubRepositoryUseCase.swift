//
//  GitHubRepositoryUseCase.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol GitHubRepositoryUseCase: class {
    func loadRepositories(repositoryName: String)
    func repository(_ repository: GitHubRepositoryUseCaseDataInput, didLoadRepositories repositories: [GitHubRepositoryEntity])
}

protocol GitHubRepositoryUseCasePresentationInput: class {
    func useCase(_ useCase: GitHubRepositoryUseCase, didLoadRepositories repositories: RepositoriesModel)
}

protocol GitHubRepositoryUseCaseDataInput: class {
    func loadRepositories(repositoryName: String)
}

class GitHubRepositoryUseCaseImpl: GitHubRepositoryUseCase {
    fileprivate let repository: GitHubRepositoryUseCaseDataInput
    fileprivate weak var presenter: GitHubRepositoryUseCasePresentationInput?

    init(repository: GitHubRepositoryUseCaseDataInput) {
        self.repository = repository
    }

    func inject(presenter: GitHubRepositoryUseCasePresentationInput) {
        self.presenter = presenter
    }

    func loadRepositories(repositoryName: String) {
        self.repository.loadRepositories(repositoryName: repositoryName)
    }

    func repository(_ repository: GitHubRepositoryUseCaseDataInput, didLoadRepositories repositories: [GitHubRepositoryEntity]) {
        let repositoriesModel = GitHubRepositoryTranslator.translate(repositories)
        self.presenter?.useCase(self, didLoadRepositories: repositoriesModel)
    }
}

//
//  GitHubRepositoryUseCase.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol GitHubRepositoryUseCaseInputDelegate: class {
    func useCase(_ useCase: GitHubRepositoryUseCase, didLoadRepositories repositories: RepositoriesModel)
}

class GitHubRepositoryUseCase {
    fileprivate let repository: GitHubRepositoryRepository
    fileprivate weak var presenter: GitHubRepositoryUseCaseInputDelegate?

    init(repository: GitHubRepositoryRepository) {
        self.repository = repository
    }

    func inject(presenter: GitHubRepositoryUseCaseInputDelegate) {
        self.presenter = presenter
    }

    func loadRepositories(repositoryName: String) {
        repository.loadRepositories(repositoryName: repositoryName)
    }
}

extension GitHubRepositoryUseCase: GitHubRepositoryRepositoryInputDelegate {
    func repository(_ repository: GitHubRepositoryRepository, didLoadRepositories repositories: [GitHubRepositoryEntity]) {
        let repositoriesModel = GitHubRepositoryTranslator.translate(repositories)
        self.presenter?.useCase(self, didLoadRepositories: repositoriesModel)
    }
}

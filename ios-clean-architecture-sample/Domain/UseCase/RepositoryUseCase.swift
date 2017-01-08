//
//  RepositoryUseCase.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol RepositoryUseCaseInputDelegate: class {
    func useCase(_ useCase: RepositoryUseCase, didLoadRepositories repositories: RepositoriesModel)
}

class RepositoryUseCase {
    fileprivate let repository: RepositoryRepository
    fileprivate weak var presenter: RepositoryUseCaseInputDelegate?

    init(repository: RepositoryRepository) {
        self.repository = repository
    }

    func inject(presenter: RepositoryUseCaseInputDelegate) {
        self.presenter = presenter
    }

    func loadRepositories(repositoryName: String) {
        repository.loadRepositories(repositoryName: repositoryName)
    }
}

extension RepositoryUseCase: RepositoryRepositoryInputDelegate {
    func repository(_ repository: RepositoryRepository, didLoadRepositories repositories: [RepositoryEntity]) {
        let repositoriesModel = RepositoryTranslator.translate(repositories)
        self.presenter?.useCase(self, didLoadRepositories: repositoriesModel)
    }
}

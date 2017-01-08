//
//  GitHubRepositoryRepository.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol GitHubRepositoryRepository: class {
    func dataStore(_ dataStore: GitHubRepositoryRepositoryInput, didLoadRepositories repositories: [GitHubRepositoryEntity])
}

protocol GitHubRepositoryRepositoryInput: class {
    func loadRepositories(repositoryName: String)
}

class GitHubRepositoryRepositoryImpl: GitHubRepositoryRepository {
    fileprivate let dataStore: GitHubRepositoryRepositoryInput
    fileprivate weak var useCase: GitHubRepositoryUseCase?

    init(dataStore: GitHubRepositoryRepositoryInput) {
        self.dataStore = dataStore
    }

    func inject(useCase: GitHubRepositoryUseCase) {
        self.useCase = useCase
    }

    func dataStore(_ dataStore: GitHubRepositoryRepositoryInput, didLoadRepositories repositories: [GitHubRepositoryEntity]) {
        self.useCase?.repository(self, didLoadRepositories: repositories)
    }
}

extension GitHubRepositoryRepositoryImpl: GitHubRepositoryUseCaseDataInput {
    func loadRepositories(repositoryName: String) {
        self.dataStore.loadRepositories(repositoryName: repositoryName)
    }
}

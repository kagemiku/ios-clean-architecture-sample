//
//  GitHubRepositoryRepository.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol GitHubRepositoryRepository: class {
    func dataStore(_ dataStore: GitHubRepositoryRepositoryInput, didSearchRepositories repositories: GitHubRepositoryEntities)
}

protocol GitHubRepositoryRepositoryInput: class {
    func searchRepositories(repositoryName: String)
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

    func dataStore(_ dataStore: GitHubRepositoryRepositoryInput, didSearchRepositories repositories: GitHubRepositoryEntities) {
        self.useCase?.repository(self, didSearchRepositories: repositories)
    }
}

extension GitHubRepositoryRepositoryImpl: GitHubRepositoryUseCaseDataInput {
    func searchRepositories(repositoryName: String) {
        self.dataStore.searchRepositories(repositoryName: repositoryName)
    }
}

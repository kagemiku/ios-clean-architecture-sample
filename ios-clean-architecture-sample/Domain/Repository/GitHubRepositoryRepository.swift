//
//  GitHubRepositoryRepository.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol GitHubRepositoryRepositoryInputDelegate: class {
    func repository(_ repository: GitHubRepositoryRepository, didLoadRepositories repositories: [GitHubRepositoryEntity])
}

class GitHubRepositoryRepository {
    fileprivate let dataStore: GitHubRepositoryDataStore
    fileprivate weak var useCase: GitHubRepositoryRepositoryInputDelegate?

    init(dataStore: GitHubRepositoryDataStore) {
        self.dataStore = dataStore
    }

    func inject(useCase: GitHubRepositoryRepositoryInputDelegate) {
        self.useCase = useCase
    }

    func loadRepositories(repositoryName: String) {
        dataStore.loadRepositories(repositoryName: repositoryName)
    }
}

extension GitHubRepositoryRepository: GitHubRepositoryDataStoreInputDelegate {
    func dataStore(_ dataStore: GitHubRepositoryDataStore, didLoadRepositories repositories: [GitHubRepositoryEntity]) {
        self.useCase?.repository(self, didLoadRepositories: repositories)
    }
}

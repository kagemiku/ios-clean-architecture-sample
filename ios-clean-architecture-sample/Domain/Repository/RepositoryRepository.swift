//
//  RepositoryRepository.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol RepositoryRepositoryInputDelegate: class {
    func repository(_ repository: RepositoryRepository, didLoadRepositories repositories: [RepositoryEntity])
}

class RepositoryRepository {
    fileprivate let dataStore: RepositoryDataStore
    fileprivate weak var useCase: RepositoryRepositoryInputDelegate?

    init(dataStore: RepositoryDataStore) {
        self.dataStore = dataStore
    }

    func inject(useCase: RepositoryRepositoryInputDelegate) {
        self.useCase = useCase
    }

    func loadRepositories(repositoryName: String) {
        dataStore.loadRepositories(repositoryName: repositoryName)
    }
}

extension RepositoryRepository: RepositoryDataStoreInputDelegate {
    func dataStore(_ dataStore: RepositoryDataStore, didLoadRepositories repositories: [RepositoryEntity]) {
        self.useCase?.repository(self, didLoadRepositories: repositories)
    }
}

//
//  RepositoryDataStore.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol RepositoryDataStoreInputDelegate: class {
    func dataStore(_ dataStore: RepositoryDataStore, didLoadRepositories repositories: [RepositoryEntity])
}

class RepositoryDataStore {
    fileprivate weak var repository: RepositoryDataStoreInputDelegate?

    func inject(repository: RepositoryDataStoreInputDelegate) {
        self.repository = repository
    }

    func loadRepositories(repositoryName: String) {
        let repo1 = RepositoryEntity(id: 1, full_name: "repo1")
        let repo2 = RepositoryEntity(id: 2, full_name: "repo2")
        let repo3 = RepositoryEntity(id: 3, full_name: "repo3")

        self.repository?.dataStore(self, didLoadRepositories: [repo1, repo2, repo3])
    }
}

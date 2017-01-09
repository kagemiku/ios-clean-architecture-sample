//
//  GitHubRepositoryDataStore.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol GitHubRepositoryDataStore: class { }

class GitHubRepositoryDataStoreImpl: GitHubRepositoryDataStore {
    fileprivate weak var repository: GitHubRepositoryRepository?

    func inject(repository: GitHubRepositoryRepository) {
        self.repository = repository
    }
}

extension GitHubRepositoryDataStoreImpl: GitHubRepositoryRepositoryInput {
    func searchRepositories(repositoryName: String) {
        let repo1 = GitHubRepositoryEntity(id: 1, full_name: "repo1")
        let repo2 = GitHubRepositoryEntity(id: 2, full_name: "repo2")
        let repo3 = GitHubRepositoryEntity(id: 3, full_name: "repo3")

        self.repository?.dataStore(self, didSearchRepositories: [repo1, repo2, repo3])
    }
}

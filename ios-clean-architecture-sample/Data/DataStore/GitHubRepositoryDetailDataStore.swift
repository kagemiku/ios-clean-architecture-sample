//
//  GitHubRepositoryDetailDataStore.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/15/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol GitHubRepositoryDetailDataStore: class { }

final class GitHubRepositoryDetailDataStoreImpl: GitHubRepositoryDetailDataStore {
    fileprivate weak var repository: GitHubRepositoryDetailRepository?

    func inject(repository: GitHubRepositoryDetailRepository) {
        self.repository = repository
    }
}

// MARK: - GitHubRepositoryDetailRepositoryInput
extension GitHubRepositoryDetailDataStoreImpl: GitHubRepositoryDetailRepositoryInput {
    func getRepositoryReadme(owner: String, repositoryName: String) {
        GitHubAPIClient.getRepositoryReadme(owner: owner, repo: repositoryName) { [weak self] response in
            guard let `self` = self else {
                return
            }

            let readmeString: String = {
                switch response {
                case .Success(let value):
                    return value
                case .Error(let error):
                    print("error: \(error)")
                    return ""
                }
            }()

            let repositoryReadmeEntity = GitHubRepositoryReadmeEntity(readmeString: readmeString)
            self.repository?.dataStore(self, didGetRepositoryReadme: repositoryReadmeEntity)
        }
    }
}

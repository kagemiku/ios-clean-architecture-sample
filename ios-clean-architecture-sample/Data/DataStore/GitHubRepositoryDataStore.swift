//
//  GitHubRepositoryDataStore.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

protocol GitHubRepositoryDataStore: class { }

final class GitHubRepositoryDataStoreImpl: GitHubRepositoryDataStore {
    fileprivate weak var repository: GitHubRepositoryRepository?

    func inject(repository: GitHubRepositoryRepository) {
        self.repository = repository
    }
}

// MARK: - GitHubRepositoryRepositoryInput
extension GitHubRepositoryDataStoreImpl: GitHubRepositoryRepositoryInput {
    func searchRepositories(repositoryName: String) {
        GitHubAPIClient.searchRepositories(query: repositoryName) { [weak self] response in
            switch response {
            case .success(let value):
                guard let `self` = self else {
                    return
                }

                self.repository?.dataStore(self, didSearchRepositories: value)
            case .error(let error):
                print("error: \(error)")
            }
        }
    }
}

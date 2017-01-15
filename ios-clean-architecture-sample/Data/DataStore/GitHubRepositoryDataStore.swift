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

class GitHubRepositoryDataStoreImpl: GitHubRepositoryDataStore {
    fileprivate weak var repository: GitHubRepositoryRepository?

    func inject(repository: GitHubRepositoryRepository) {
        self.repository = repository
    }
}

extension GitHubRepositoryDataStoreImpl: GitHubRepositoryRepositoryInput {
    func searchRepositories(repositoryName: String) {
        guard let name = repositoryName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }

        GitHubAPIClient<GitHubRepositoryEntities>.searchRepositories(params: ["q": name]) { [weak self] response in
            switch response {
            case .Success(let value):
                guard let `self` = self else {
                    return
                }

                self.repository?.dataStore(self, didSearchRepositories: value)
            case .Error(let error):
                print("error: \(error)")
            }
        }
    }
}

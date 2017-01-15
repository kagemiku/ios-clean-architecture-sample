//
//  GitHubRepositoryDetailDataStore.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/15/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol GitHubRepositoryDetailDataStore: class { }

class GitHubRepositoryDetailDataStoreImpl: GitHubRepositoryDetailDataStore {
    fileprivate weak var repository: GitHubRepositoryDetailRepository?

    func inject(repository: GitHubRepositoryDetailRepository) {
        self.repository = repository
    }
}

extension GitHubRepositoryDetailDataStoreImpl: GitHubRepositoryDetailRepositoryInput { }

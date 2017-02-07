//
//  GitHubRepositoryDetailRepository.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/15/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol GitHubRepositoryDetailRepository: class {
    func dataStore(_ dataStore: GitHubRepositoryDetailRepositoryInput, didGetRepositoryReadme readme: GitHubRepositoryReadmeEntity)
}

protocol GitHubRepositoryDetailRepositoryInput: class {
    func getRepositoryReadme(owner: String, repositoryName: String)
}

final class GitHubRepositoryDetailRepositoryImpl: GitHubRepositoryDetailRepository {
    fileprivate let dataStore: GitHubRepositoryDetailRepositoryInput
    fileprivate weak var useCase: GitHubRepositoryDetailUseCase?

    init(dataStore: GitHubRepositoryDetailRepositoryInput) {
        self.dataStore = dataStore
    }

    func inject(useCase: GitHubRepositoryDetailUseCase) {
        self.useCase = useCase
    }

    func dataStore(_ dataStore: GitHubRepositoryDetailRepositoryInput, didGetRepositoryReadme readme: GitHubRepositoryReadmeEntity) {
        self.useCase?.repository(self, didGetRepositoryReadme: readme)
    }
}

// MARK: - GitHubRepositoryDetailUseCaseDataInput
extension GitHubRepositoryDetailRepositoryImpl: GitHubRepositoryDetailUseCaseDataInput {
    func getRepositoryReadme(owner: String, repositoryName: String) {
        self.dataStore.getRepositoryReadme(owner: owner, repositoryName: repositoryName)
    }
}

//
//  GitHubRepositoryDetailRepository.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/15/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol GitHubRepositoryDetailRepository: class { }

protocol GitHubRepositoryDetailRepositoryInput: class { }

final class GitHubRepositoryDetailRepositoryImpl: GitHubRepositoryDetailRepository {
    fileprivate let dataStore: GitHubRepositoryDetailRepositoryInput
    fileprivate weak var useCase: GitHubRepositoryDetailUseCase?

    init(dataStore: GitHubRepositoryDetailRepositoryInput) {
        self.dataStore = dataStore
    }

    func inject(useCase: GitHubRepositoryDetailUseCase) {
        self.useCase = useCase
    }
}

// MARK: - GitHubRepositoryDetailUseCaseDataInput
extension GitHubRepositoryDetailRepositoryImpl: GitHubRepositoryDetailUseCaseDataInput { }

//
//  GitHubRepositoryDetailUseCase.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/15/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol GitHubRepositoryDetailUseCase: class { }

protocol GitHubRepositoryDetailUseCasePresentationInput: class{ }

protocol GitHubRepositoryDetailUseCaseDataInput: class { }

final class GitHubRepositoryDetailUseCaseImpl: GitHubRepositoryDetailUseCase {
    fileprivate let repository: GitHubRepositoryDetailUseCaseDataInput
    fileprivate weak var presenter: GitHubRepositoryDetailUseCasePresentationInput?

    init(repository: GitHubRepositoryDetailUseCaseDataInput) {
        self.repository = repository
    }

    func inject(presenter: GitHubRepositoryDetailUseCasePresentationInput) {
        self.presenter = presenter
    }
}

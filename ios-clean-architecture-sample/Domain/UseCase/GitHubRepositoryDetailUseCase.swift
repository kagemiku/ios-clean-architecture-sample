//
//  GitHubRepositoryDetailUseCase.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/15/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol GitHubRepositoryDetailUseCase: class {
    func getRepositoryReadme(model: GitHubRepositoryModel)
    func repository(_ repository: GitHubRepositoryDetailUseCaseDataInput, didGetRepositoryReadme readme: GitHubRepositoryReadmeEntity)
}

protocol GitHubRepositoryDetailUseCasePresentationInput: class {
    func useCase(_ useCase: GitHubRepositoryDetailUseCase, didGetRepositoryReadme readme: GitHubRepositoryReadmeModel)
}

protocol GitHubRepositoryDetailUseCaseDataInput: class {
    func getRepositoryReadme(owner: String, repositoryName: String)
}

final class GitHubRepositoryDetailUseCaseImpl: GitHubRepositoryDetailUseCase {
    fileprivate let repository: GitHubRepositoryDetailUseCaseDataInput
    fileprivate weak var presenter: GitHubRepositoryDetailUseCasePresentationInput?

    init(repository: GitHubRepositoryDetailUseCaseDataInput) {
        self.repository = repository
    }

    func inject(presenter: GitHubRepositoryDetailUseCasePresentationInput) {
        self.presenter = presenter
    }

    func getRepositoryReadme(model: GitHubRepositoryModel) {
        self.repository.getRepositoryReadme(owner: model.owner.name, repositoryName: model.name)
    }

    func repository(_ repository: GitHubRepositoryDetailUseCaseDataInput, didGetRepositoryReadme readme: GitHubRepositoryReadmeEntity) {
        let repositoryReadmeModel = GitHubRepositoryReadmeTranslator.translate(readme)
        self.presenter?.useCase(self, didGetRepositoryReadme: repositoryReadmeModel)
    }
}

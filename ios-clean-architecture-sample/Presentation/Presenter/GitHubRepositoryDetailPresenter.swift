//
//  GitHubRepositoryDetailPresenter.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/15/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol GitHubRepositoryDetailPresenter: class {
    func setupDataSource(model: GitHubRepositoryModel)
    func getRepositoryReadme(model: GitHubRepositoryModel)
}

protocol GitHubRepositoryDetailPresenterInput: class {
    func setRepositoryDetailModel(_ repositoryDetailModel: [GitHubRepositoryDetailModel])
    func setRepositoryReadmeModel(_ repositoryReadmeModel: GitHubRepositoryReadmeModel)
}

final class GitHubRepositoryDetailPresenterImpl: GitHubRepositoryDetailPresenter {
    fileprivate let useCase: GitHubRepositoryDetailUseCase
    fileprivate weak var viewController: GitHubRepositoryDetailPresenterInput?

    init(useCase: GitHubRepositoryDetailUseCase) {
        self.useCase = useCase
    }

    func inject(viewController: GitHubRepositoryDetailPresenterInput) {
        self.viewController = viewController
    }

    func setupDataSource(model: GitHubRepositoryModel) {
        var dataSource: [GitHubRepositoryDetailModel] = []
        dataSource.append(GitHubRepositoryDetailModel.Description(text: model.description))
        dataSource.append(GitHubRepositoryDetailModel.Owner(model: model.owner))

        self.viewController?.setRepositoryDetailModel(dataSource)
    }

    func getRepositoryReadme(model: GitHubRepositoryModel) {
        self.useCase.getRepositoryReadme(model: model)
    }
}

// MARK: - GitHubRepositoryDetailUseCasePresentationInput
extension GitHubRepositoryDetailPresenterImpl: GitHubRepositoryDetailUseCasePresentationInput {
    func useCase(_ useCase: GitHubRepositoryDetailUseCase, didGetRepositoryReadme readme: GitHubRepositoryReadmeModel) {
        self.viewController?.setRepositoryReadmeModel(readme)
    }
}

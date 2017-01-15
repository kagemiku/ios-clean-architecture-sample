//
//  GitHubRepositoryDetailPresenter.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/15/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol GitHubRepositoryDetailPresenter: class { }

protocol GitHubRepositoryDetailPresenterInput: class { }

class GitHubRepositoryDetailPresenterImpl: GitHubRepositoryDetailPresenter {
    fileprivate let useCase: GitHubRepositoryDetailUseCase
    fileprivate weak var viewController: GitHubRepositoryDetailPresenterInput?

    init(useCase: GitHubRepositoryDetailUseCase) {
        self.useCase   = useCase
    }

    func inject(viewController: GitHubRepositoryDetailPresenterInput) {
        self.viewController = viewController
    }
}

extension GitHubRepositoryDetailPresenterImpl: GitHubRepositoryDetailUseCasePresentationInput { }

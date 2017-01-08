//
//  GitHubRepositoryTranslator.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

final class GitHubRepositoryTranslator {
    static func translate(_ entity: [GitHubRepositoryEntity]) -> RepositoriesModel {
        let repositories = entity.map {
            GitHubRepositoryModel(repositoryName: $0.full_name)
        }

        return RepositoriesModel(repositories: repositories)
    }
}

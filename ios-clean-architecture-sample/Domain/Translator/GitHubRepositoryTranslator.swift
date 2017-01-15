//
//  GitHubRepositoryTranslator.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

final class GitHubRepositoryTranslator {
    static func translate(_ entity: [GitHubRepositoryEntity]) -> GitHubRepositoriesModel {
        let repositories: [GitHubRepositoryModel] = entity.map {
            let name = $0.name
            let fullName = $0.full_name
            let owner = GitHubRepositoryOwnerModel(name: $0.owner.login)
            let isPrivate = $0.private
            let description = $0.description
            let watchersCount = $0.watchers_count
            let stargazersCount = $0.stargazers_count
            let forksCount = $0.forks_count

            return GitHubRepositoryModel(name: name,
                                         fullName: fullName,
                                         owner: owner,
                                         isPrivate: isPrivate,
                                         description: description,
                                         watchersCount: watchersCount,
                                         stargazersCount: stargazersCount,
                                         forksCount: forksCount)
        }

        return GitHubRepositoriesModel(repositories: repositories)
    }
}

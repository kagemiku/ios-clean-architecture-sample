//
//  GitHubRepositoryTranslator.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

final class GitHubRepositoriesTranslator: Translator {
    typealias Input  = GitHubRepositoriesEntity
    typealias Output = GitHubRepositoriesModel

    static func translate(_ entity: Input) -> Output {
        let repositories: [GitHubRepositoryModel] = entity.items.map {
            GitHubRepositoryTranslator.translate($0)
        }

        return GitHubRepositoriesModel(repositories: repositories)
    }
}

final class GitHubRepositoryTranslator: Translator {
    typealias Input  = GitHubRepositoryEntity
    typealias Output = GitHubRepositoryModel

    static func translate(_ entity: Input) -> Output {
        let name            = entity.name
        let fullName        = entity.full_name
        let owner           = GitHubRepositoryOwnerTranslator.translate(entity.owner)
        let isPrivate       = entity.private
        let description     = entity.description
        let watchersCount   = entity.watchers_count
        let stargazersCount = entity.stargazers_count
        let forksCount      = entity.forks_count

        return GitHubRepositoryModel(name: name,
                                     fullName: fullName,
                                     owner: owner,
                                     isPrivate: isPrivate,
                                     description: description,
                                     watchersCount: watchersCount,
                                     stargazersCount: stargazersCount,
                                     forksCount: forksCount)
    }
}

final class GitHubRepositoryOwnerTranslator: Translator {
    typealias Input  = GitHubRepositoryOwnerEntity
    typealias Output = GitHubRepositoryOwnerModel

    static func translate(_ entity: Input) -> Output {
        let name = entity.login

        return GitHubRepositoryOwnerModel(name: name)
    }
}

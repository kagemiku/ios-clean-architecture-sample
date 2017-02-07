//
//  GitHubRepositoryDetailTranslator.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 2/7/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

final class GitHubRepositoryReadmeTranslator: Translator {
    typealias Input  = GitHubRepositoryReadmeEntity
    typealias Output = GitHubRepositoryReadmeModel

    static func translate(_ entity: Input) -> Output {
        return GitHubRepositoryReadmeModel(readmeString: entity.readmeString)
    }
}

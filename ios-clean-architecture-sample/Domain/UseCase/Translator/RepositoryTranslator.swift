//
//  RepositoryTranslator.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

final class RepositoryTranslator {
    static func translate(_ entity: [RepositoryEntity]) -> RepositoriesModel {
        let repositories = entity.map {
            RepositoryModel(repositoryName: $0.full_name)
        }

        return RepositoriesModel(repositories: repositories)
    }
}

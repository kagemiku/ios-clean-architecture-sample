//
//  RepositoriesModel.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

struct RepositoriesModel {
    var repositories: [RepositoryModel] = []
}

struct RepositoryModel {
    let repositoryName: String

    init(repositoryName: String) {
        self.repositoryName = repositoryName
    }
}

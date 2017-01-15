//
//  GitHubRepositoriesModel.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

struct GitHubRepositoriesModel {
    var repositories: [GitHubRepositoryModel] = []
}

struct GitHubRepositoryModel {
    let name: String
    let fullName: String
    let owner: GitHubRepositoryOwnerModel
    let isPrivate: Bool
    let description: String
    let watchersCount: Int
    let stargazersCount: Int
    let forksCount: Int
}

struct GitHubRepositoryOwnerModel {
    let name: String
}

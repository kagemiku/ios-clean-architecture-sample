//
//  GitHubRepositoryDetailModel.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/15/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

enum GitHubRepositoryDetailModel {
    case Description(text: String)
    case Owner(model: GitHubRepositoryOwnerModel)
}

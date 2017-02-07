//
//  GitHubRepositoryDetailEntity.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 2/7/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

struct GitHubRepositoryReadmeEntity {
    var readmeString: String = ""

    init(readmeString: String) {
        self.readmeString = readmeString
    }
}

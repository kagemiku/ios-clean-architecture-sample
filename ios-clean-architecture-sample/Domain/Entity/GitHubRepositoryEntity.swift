//
//  GitHubRepositoryEntity.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

import ObjectMapper

struct GitHubRepositoryEntities: Mappable {
    var items: [GitHubRepositoryEntity] = []

    init?(map: Map) { }

    mutating func mapping(map: Map) {
        self.items <- map["items"]
    }
}

struct GitHubRepositoryEntity: Mappable {
    var id = 0
    var full_name = ""

    init?(map: Map) { }

    mutating func mapping(map: Map) {
        self.id        <- map["id"]
        self.full_name <- map["full_name"]
    }
}

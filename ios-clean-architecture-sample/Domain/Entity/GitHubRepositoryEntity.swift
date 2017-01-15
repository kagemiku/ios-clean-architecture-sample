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
    var name = ""
    var full_name = ""
    var owner = GitHubRepositoryOwnerEntity()
    var `private` = false
    var watchers_count = 0
    var stargazers_count = 0
    var forks_count = 0

    init?(map: Map) { }

    mutating func mapping(map: Map) {
        self.id               <- map["id"]
        self.name             <- map["name"]
        self.full_name        <- map["full_name"]
        self.owner            <- map["owner"]
        self.private          <- map["private"]
        self.watchers_count   <- map["watchers_count"]
        self.stargazers_count <- map["stargazers_count"]
        self.forks_count      <- map["forks_count"]
    }
}

struct GitHubRepositoryOwnerEntity: Mappable {
    var login = ""
    var id = 0

    init?(map: Map) { }

    init() {
        self.login = ""
        self.id    = 0
    }

    mutating func mapping(map: Map) {
        self.login <- map["login"]
        self.id    <- map["id"]
    }
}

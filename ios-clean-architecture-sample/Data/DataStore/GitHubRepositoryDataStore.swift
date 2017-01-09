//
//  GitHubRepositoryDataStore.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

protocol GitHubRepositoryDataStore: class { }

class GitHubRepositoryDataStoreImpl: GitHubRepositoryDataStore {
    fileprivate weak var repository: GitHubRepositoryRepository?

    func inject(repository: GitHubRepositoryRepository) {
        self.repository = repository
    }
}

extension GitHubRepositoryDataStoreImpl: GitHubRepositoryRepositoryInput {
    func searchRepositories(repositoryName: String) {
        guard let name = repositoryName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }

        GitHubAPIClient<JSON>.searchRepositories(params: ["q": name]) { [weak self] response in
            switch response {
            case .Success(let value):
                guard let `self` = self else {
                    return
                }

                let entities = self.parseAPIResponse(value)
                self.repository?.dataStore(self, didSearchRepositories: entities)
            case .Error(let error):
                print("error: \(error)")
            }
        }
    }

    private func parseAPIResponse(_ response: JSON) -> [GitHubRepositoryEntity] {
        guard let items = response["items"].array else {
            return []
        }

        var entities: [GitHubRepositoryEntity] = []
        for item in items {
            guard
                let id = item["id"].int,
                let full_name = item["full_name"].string
            else {
                return []
            }

            let entity = GitHubRepositoryEntity(id: id, full_name: full_name)
            entities.append(entity)
        }

        return entities
    }
}

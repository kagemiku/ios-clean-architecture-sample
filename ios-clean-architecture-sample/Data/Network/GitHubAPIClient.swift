//
//  GitHubAPIClient.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/9/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

import Alamofire

class GitHubAPIClient: APIClient {
    enum Router {
        static let host = "https://api.github.com"

        case SearchRepositories(q: String)

        var urlString: String {
            var path = Router.host

            switch self {
            case .SearchRepositories:
                path.append("/search/repositories")
            }

            return path
        }

        var parameters: Parameters {
            switch self {
            case let .SearchRepositories(q):
                return ["q": q]
            }
        }
    }
}

extension GitHubAPIClient {
    typealias SearchRepositoriesCompletionHandler = (Result<GitHubRepositoriesEntity>) -> ()
    class func searchRepositories(query: String, completionHandler: SearchRepositoriesCompletionHandler? = nil) {
       let urlString = GitHubAPIClient.Router.SearchRepositories(q: query).urlString
       let parameters = GitHubAPIClient.Router.SearchRepositories(q: query).parameters
       GitHubAPIClient.request(url: urlString, method: .get, parameters: parameters, completionHandler: completionHandler)
    }
}

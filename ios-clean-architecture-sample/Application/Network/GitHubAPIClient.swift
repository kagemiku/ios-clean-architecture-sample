//
//  GitHubAPIClient.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/9/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

import Alamofire

final class GitHubAPIClient: APIClient {
    // MARK: - /
    enum Router: Routable {
        static let host = "https://api.github.com"

        var urlString: String {
            return ""
        }

        var parameters: Parameters {
            return [:]
        }

        // MARK: /repos
        enum Repos: Routable {
            static let path = Router.host + "/repos"

            var urlString: String {
                var path = Repos.path

                switch self {
                case let .Readme(owner, repo):
                    path.append("/\(owner)/\(repo)/readme")
                }

                return path
            }

            var parameters: Parameters {
                return [:]
            }

            // MARK: /repos/:owner/:repo/readme
            case Readme(owner: String, repo: String)
        }

        // MARK: /search
        enum Search: Routable {
            static let path = Router.host + "/search"

            var urlString: String {
                var path = Search.path

                switch self {
                case .Repositories:
                    path.append("/repositories")
                }

                return path
            }

            var parameters: Parameters {
                var params: Parameters = [:]

                switch self {
                case let .Repositories(q, sort, order):
                    params["q"] = q

                    if let s = sort {
                        params["sort"] = s
                        if let o = order {
                            params["order"] = o
                        }
                    }
                }

                return params
            }

            // MARK: /search/repositories
            case Repositories(q: String, sort: String?, order: String?)
        }
    }
}

// MARK: - Interface
extension GitHubAPIClient {
    typealias SearchRepositoriesCompletionHandler = (Result<GitHubRepositoriesEntity>) -> Void
    typealias GetRepositoryReadmeCompletionHandler = (Result<String>) -> Void

    class func searchRepositories(query: String,
                                  sort: String? = nil,
                                  order: String? = nil,
                                  completionHandler: SearchRepositoriesCompletionHandler? = nil) {
        let router     = GitHubAPIClient.Router.Search.Repositories(q: query, sort: sort, order: order)
        let urlString  = router.urlString
        let parameters = router.parameters

        GitHubAPIClient.request(url: urlString, method: .get, parameters: parameters, completionHandler: completionHandler)
    }

    class func getRepositoryReadme(owner: String,
                                   repo: String,
                                   completionHandler: GetRepositoryReadmeCompletionHandler? = nil) {
        let router     = GitHubAPIClient.Router.Repos.Readme(owner: owner, repo: repo)
        let urlString  = router.urlString
        let parameters = router.parameters
        let headers    = ["Accept": "application/vnd.github.v3.raw"]

        GitHubAPIClient.requestRawString(url: urlString, method: .get, parameters: parameters, headers: headers, completionHandler: completionHandler)
    }
}

//
//  GitHubAPIClient.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/9/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

import Alamofire
import ObjectMapper
import SwiftyJSON

enum Result<T> {
    case Success(T)
    case Error(Error)
}

class APIClient {
    class func request<T: Mappable>(url: URLConvertible, method: Alamofire.HTTPMethod, parameters: Parameters, completionHandler: ((Result<T>) -> ())? = nil) {
        Alamofire.request(url, method: method, parameters: parameters)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let entity = Mapper<T>().map(JSONObject: value) {
                        completionHandler?(Result<T>.Success(entity))
                    }
                case .failure(let error):
                    completionHandler?(Result<T>.Error(error))
                }
            }
    }
}

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

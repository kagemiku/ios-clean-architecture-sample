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

enum GitHubAPIRouter: URLRequestConvertible {
    static let baseURLString = "https://api.github.com"

    case SearchRepositories(Parameters)

    func asURLRequest() throws -> URLRequest {
        let (method, path, parameters): (String, String, Parameters) = {
            switch self {
            case .SearchRepositories(let params):
                return ("GET", "/search/repositories", params)
            }
        }()

        let url = NSURL(string: GitHubAPIRouter.baseURLString)
        var urlRequest = URLRequest(url: url!.appendingPathComponent(path)!)
        urlRequest.httpMethod = method
        let encodedURLRequest = try URLEncoding.queryString.encode(urlRequest, with: parameters)

        return encodedURLRequest
    }
}

class GitHubAPIClient<T> {
    static func searchRepositories(params: Parameters, completionHandler: ((Result<T>) -> ())? = nil) {
        Alamofire.request(GitHubAPIRouter.SearchRepositories(params))
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let entities = Mapper<GitHubRepositoryEntities>().map(JSONObject: value) as? T {
                        completionHandler?(Result<T>.Success(entities))
                    }
                case .failure(let error):
                    completionHandler?(Result<T>.Error(error))
                }
            }
    }
}

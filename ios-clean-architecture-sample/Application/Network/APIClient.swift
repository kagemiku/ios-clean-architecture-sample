//
//  APIClient.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/16/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

import Alamofire
import ObjectMapper

public enum Result<T> {
    case success(T)
    case error(Error)
}

public protocol Routable {
    var urlString: String { get }
    var parameters: Parameters { get }
}

open class APIClient {
    typealias CompletionHandler<T> = (Result<T>) -> ()

    class func request<T: Mappable>(url: URLConvertible,
                                    method: Alamofire.HTTPMethod,
                                    parameters: Parameters? = nil,
                                    headers: HTTPHeaders? = nil,
                                    completionHandler: CompletionHandler<T>? = nil) {
        Alamofire.request(url, method: method, parameters: parameters, headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let entity = Mapper<T>().map(JSONObject: value) {
                        completionHandler?(Result<T>.success(entity))
                    }
                case .failure(let error):
                    completionHandler?(Result<T>.error(error))
                }
            }
    }

    class func requestRawString(url: URLConvertible,
                                method: Alamofire.HTTPMethod,
                                parameters: Parameters? = nil,
                                headers: HTTPHeaders? = nil,
                                completionHandler: CompletionHandler<String>? = nil) {
        Alamofire.request(url, method: method, parameters: parameters, headers: headers)
            .validate()
            .responseString { response in
                switch response.result {
                case .success(let value):
                    completionHandler?(Result<String>.success(value))
                case .failure(let error):
                    completionHandler?(Result<String>.error(error))
                }
            }
    }
}

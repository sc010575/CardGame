//
//  Network.swift
//  CakeShowCase
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import Foundation

enum Constant {
    static let baseUrl = "https://cards.davidneal.io/api"
    static let type = "cards"
}

protocol Requestable {
    func urlRequest() -> URLRequest
}

extension URLRequest: Requestable {
    func urlRequest() -> URLRequest { return self }
}

struct Request: Requestable {
    let baseUrl: URL
    let type: String
    let method: String

    init(_ baseURL: URL, type: String, method: String = "GET") {
        self.baseUrl = baseURL
        self.type = type
        self.method = method
    }

    func urlRequest() -> URLRequest {
        let finalUrl = baseUrl.appendingPathComponent(type)
        var request = URLRequest(url: finalUrl)
        request.httpMethod = method
        return request
    }

}

enum AppError: Error {
    case dataError (errorMessage: String)
    case jsonParseError(error: String)
}


protocol NetworkUseCase {
    func send(_ request: Requestable, completionHandler: @escaping (Result<Data, AppError>) -> Void)
}

final class NetworkHandler: NetworkUseCase {
    func send(_ request: Requestable, completionHandler: @escaping (Result<Data, AppError>) -> Void) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: request.urlRequest(), completionHandler: { (data, res, err) in
                let result: Result<Data, AppError>
                if let error = err {
                    result = .failure(.dataError(errorMessage: error.localizedDescription))
                } else {
                    if let httpResponse = res as? HTTPURLResponse,
                        httpResponse.statusCode == 200, let data = data {
                        result = .success(data)
                    } else {
                        result = .failure(.dataError(errorMessage: "Some unknown error"))
                    }
                    DispatchQueue.main.async {
                        completionHandler(result)
                    }
                }
            })
        task.resume()
    }
}

//
//  Serialize.swift
//  CardGame
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import Foundation

protocol Serialize {
    typealias ResultType = Result<Model?,AppError>
    associatedtype Model
    static func parseJson(_ data:Data) -> ResultType
}


final class JsonSerialize<T:Decodable>: Serialize {
    typealias Model = T
    static func parseJson(_ data:Data) -> ResultType {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let model = try decoder.decode(Model.self, from: data)
            return .success(model)
        }catch {
            return .failure(.jsonParseError(error: "Json Parsing Error"))
        }
        
    }
}

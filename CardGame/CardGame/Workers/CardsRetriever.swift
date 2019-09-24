//
//  CakeService.swift
//  CakeShowCase
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import Foundation

protocol CardsRetrieverUseCase {
    typealias ResultType = Result<[Card]?,AppError>
    func fetchCakeDetails(completion: @escaping (ResultType) -> ())
}

class CardsRetriever : CardsRetrieverUseCase {
    
    private let network: NetworkUseCase
    init(_ network:NetworkUseCase = NetworkHandler()) {
        self.network = network
    }
    
    func fetchCakeDetails(completion: @escaping (ResultType) -> ()) {
        
        guard let baseUrl = URL(string: Constant.baseUrl) else { return completion(.failure(.dataError(errorMessage: "Url is wrong"))) }
        
        let request: Requestable = Request(baseUrl, type: Constant.type)
        
        network.send(request) { result in
            switch result {
            case .success(let data):
                if let cakeList:ResultType = JsonSerialize.parseJson(data) {
                    switch cakeList {
                    case .success(let cards):
                        completion(.success(cards ?? []))
                    case .failure(let jsonError):
                        completion(.failure(jsonError))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

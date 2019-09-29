//
//  CardsRetrieverMock.swift
//  CardGameTests
//
//  Created by Suman Chatterjee on 29/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import Foundation
import XCTest

@testable import CardGame

class NetworkMock:NetworkUseCase {
    func send(_ request: Requestable, completionHandler: @escaping (Result<Data, AppError>) -> Void) {
        guard let modelToTestData = Fixture.getData("Cards") else { return completionHandler(.failure(.jsonParseError(error: "Json error")))
        }
        completionHandler(.success(modelToTestData))
    }
}

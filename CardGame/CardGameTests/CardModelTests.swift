//
//  CardGameTests.swift
//  CardGameTests
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import XCTest
@testable import CardGame

class CardModelTests: XCTestCase {

    func testCardsModelWhenDataAvailable() {
        
        guard let modelToTestData = Fixture.getData("Cards") else { return XCTAssert(true, "json file error") }
        
        let modelResult:Result<[Card]?,AppError> = JsonSerialize.parseJson(modelToTestData)
        switch modelResult {
        case .success(let modelToTest):
            XCTAssertEqual(modelToTest?.count, 52)
            let model = modelToTest?.first
            XCTAssertEqual(model?.value, "A")
            XCTAssertEqual(model?.rank, Rank.Ace)
            XCTAssertEqual(model?.suit, "spades")
        default:
            break
        }
        
    }
}

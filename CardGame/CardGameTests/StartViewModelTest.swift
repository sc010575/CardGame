//
//  StartViewModelTest.swift
//  CardGameTests
//
//  Created by Suman Chatterjee on 29/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import XCTest
@testable import CardGame

class StartViewModelTest: XCTestCase {

    var currentExpectaion: XCTestExpectation?
    var expectedCanSubmit: Bool = false
    var expectedErrorMessage: String = ""
    var dataItem: StartViewModel.DataItem?
    
    override func setUp() {
        dataItem = StartViewModel.DataItem(title: "A title", gameTitle: "A game title", description: "A description")
    }

    func testInitialDefaults() {
        let vm = StartViewModel(dataItem: dataItem!)
        let resultDataItem = vm.dataItemToShow() as! StartViewModel.DataItem
        XCTAssertEqual("A title", resultDataItem.title)
        XCTAssertEqual("A game title", resultDataItem.gameTitle)
        XCTAssertEqual("A description", resultDataItem.description)
        XCTAssertNil(vm.coordinatorDelegate)
        XCTAssertEqual(vm.state.value, StartViewModelState.dataNotInitiated)
    }
    
    func test_GivenSuccessfullNetworkResponse_WhenFetchDataSuccessful_thenViewModelStateShouldChange() {
        let networkMock = NetworkMock()
        let cardRetrieveService = CardsRetriever(networkMock)
        let vm = StartViewModel(dataItem: dataItem!, cardsRetriever: cardRetrieveService)
        vm.fetchCards()
        XCTAssertEqual(vm.state.value, StartViewModelState.canStartNewGame)
    }

}

extension StartViewModelTest: StartViewModelCoordinatorDelegate
{
    func startViewModelShouldStartNewGame(viewModel: StartViewModel) {
        currentExpectaion?.fulfill()

    }
}

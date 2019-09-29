//
//  StartViewModel.swift
//  CardGame
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import Foundation

protocol StartViewModelCoordinatorDelegate: class
{
    func startViewModelShouldStartNewGame(viewModel: StartViewModel)
}

enum StartViewModelState {
    case dataNotInitiated, canStartNewGame, fetchDataError
}

protocol StartViewModelUseCase  {
    var coordinatorDelegate: StartViewModelCoordinatorDelegate? { get set}
    var state: Observer<StartViewModelState> { get set }
    func fetchCards()
    func onTapStart()
    func dataItemToShow() -> ViewModelProtocol?
}

final class StartViewModel:StartViewModelUseCase{
    var state: Observer<StartViewModelState> = Observer(.dataNotInitiated)
    
    struct DataItem: ViewModelProtocol {
        let title: String
        let gameTitle: String
        let description: String
    }

    private let dataItem:DataItem?
    private let cardsRetriever:CardsRetrieverUseCase
    private let gameHandler = CardGameHandler.shared
 
    weak var coordinatorDelegate:StartViewModelCoordinatorDelegate?

    init(dataItem:DataItem, cardsRetriever:CardsRetrieverUseCase = CardsRetriever()) {
        self.cardsRetriever = cardsRetriever
        self.dataItem = dataItem
    }
    
    func fetchCards() {
        cardsRetriever.fetchCardDetails ( completion: { [weak self]  (result) in
            switch result {
            case .success(let cards):
                guard let cards = cards else { return }
                self?.gameHandler.populateCards(cards)
                self?.state.value = .canStartNewGame
            case .failure(let error):
                print(error)
                self?.state.value = .fetchDataError
            }
        })
    }
    
    func onTapStart() {
        coordinatorDelegate?.startViewModelShouldStartNewGame(viewModel:self)
    }
    
    func dataItemToShow() -> ViewModelProtocol? {
        return dataItem
    }
}

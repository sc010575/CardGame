//
//  StartViewModel.swift
//  CardGame
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import Foundation

protocol StartViewModelUseCase {
    var delegate: CardShowCaseCoordinatorDelegate? { get set}
    func title() -> String
    func fetchCards()
    func onTapStart() 
}

final class StartViewModel:StartViewModelUseCase {
    
    weak var delegate:CardShowCaseCoordinatorDelegate?
    private let cardsRetriever:CardsRetrieverUseCase
    private let gameHandler = CardGameHandler.shared
    
    init(_ cardsRetriever:CardsRetrieverUseCase = CardsRetriever()) {
        self.cardsRetriever = cardsRetriever
    }
    
    func title() -> String {
        return "Card Higher or Lower game"
    }
    
    func fetchCards() {
        cardsRetriever.fetchCardDetails ( completion: { [weak self]  (result) in
            switch result {
            case .success(let cards):
                guard let cards = cards else { return }
                self?.gameHandler.populateCards(cards)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func onTapStart() {
        delegate?.shouldStartNewGame()
    }
}

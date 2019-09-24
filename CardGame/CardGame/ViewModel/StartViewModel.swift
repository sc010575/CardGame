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
    
    init(_ cardsRetriever:CardsRetrieverUseCase = CardsRetriever()) {
        self.cardsRetriever = cardsRetriever
    }
    
    func title() -> String {
        return "Card Higher or Lower"
    }
    
    func fetchCards() {
        cardsRetriever.fetchCakeDetails (completion: { (result) in
            switch result {
            case .success(let cards):
                print(cards)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func onTapStart() {
        delegate?.startViewModelDidSelectStartNewGame(self)
    }
}

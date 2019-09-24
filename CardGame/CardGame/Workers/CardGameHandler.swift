//
//  CardGameHandler.swift
//  CardGame
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import Foundation

class CardGameHandler {

    static let shared = CardGameHandler()
    private var cards = [Card]()

    private init() { }

    func populateCards(_ newCards: [Card]) {
        cards = newCards
    }

    func currentCardToShow() -> Card? {
        return cards.first
    }
}

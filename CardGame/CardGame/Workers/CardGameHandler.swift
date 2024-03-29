//
//  CardGameHandler.swift
//  CardGame
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import Foundation

protocol CardGameHandlerListener: class {
    func lifeLineStatusDidChanged()
}

class CardGameHandler {

    static let shared = CardGameHandler()
    private var cards = [Card]()
    private var shuffledCards = [Card]()
    private var progressInHigherOrder = false
    private var successCounter = 0
    private var currentLifeLine = 0

    var listeners = [CardGameHandlerListener]()


    private init() { }

    func populateCards(_ newCards: [Card]) {
        cards = newCards
        successCounter = 0
    }


    func currentCardToShow() -> Card? {
        progress()
        return cardToShow()
    }

    func matchOrder(_ input: Bool) -> Bool {
        let result = progressInHigherOrder == input ? true : false
        if result {
            successCounter += 1
        } else {
            currentLifeLine -= 1
            notifyListner()

        }
    //    print(result, successCounter, currentLifeLine)
        return result
    }

    func getSuccessCounter() -> Int {
        return successCounter
    }

    func lifeLineCheck() -> Int {
        return currentLifeLine
    }

    func resetHandler() {
        successCounter = 0
        currentLifeLine = 0
        shuffledCards.removeAll()
    }

    func shuffleCards() {
        shuffle()
    }

    func addListener(listener: CardGameHandlerListener) {
        listeners.append(listener)
    }

    func removeListener(listener: CardGameHandlerListener) {
        listeners = listeners.filter { $0 !== listener }
    }

}

fileprivate extension CardGameHandler {

    func shuffle() {
        shuffledCards = cards.shuffled()
        currentLifeLine = 3
    }

    func cardToShow() -> Card? {
        let cardToShow = shuffledCards.first
        shuffledCards.remove(at: 0)
        return cardToShow
    }

    func progress() {
        guard let currentCard = shuffledCards.first else { return }
        let nextCard = shuffledCards[1]
        
        if nextCard.rank.rawValue == currentCard.rank.rawValue {
            return
        }
        
        if nextCard.rank.rawValue > currentCard.rank.rawValue {
            progressInHigherOrder = true
        } else {
            progressInHigherOrder = false
        }
    }
    
    func notifyListner() {
        self.listeners.forEach {
            $0.lifeLineStatusDidChanged()
        }
    }
}

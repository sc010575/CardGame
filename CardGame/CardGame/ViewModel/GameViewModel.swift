//
//  GameViewModel.swift
//  CardGame
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import Foundation

enum GameState {
    case notStarted, cotinue, lifeLineReduce, stop
}

protocol GameViewModelUseCase {
    var state: Observer<GameState> { get set }
    var delegate: CardShowCaseCoordinatorDelegate? { get set }
    func title() -> String
    func showCurrentChoice() -> Card?
    func handleHighOrLow(_ input: Bool)
    func currentLifeLines() -> Int
    func gameStart()
    func gameOver()
}

final class GameViewModel: GameViewModelUseCase {

    var state: Observer<GameState> = Observer(.notStarted)
    var delegate: CardShowCaseCoordinatorDelegate?
    private let gameHandler = CardGameHandler.shared

    func title() -> String {
        return "Game is on going..."
    }

    func showCurrentChoice() -> Card? {
        return gameHandler.currentCardToShow()
    }

    func handleHighOrLow(_ input: Bool) {
        if gameHandler.matchOrder(input) || gameHandler.lifeLineCheck() > 0 {
            state.value = (state.value == .lifeLineReduce) ? .lifeLineReduce : .cotinue
        } else {
            state.value = .stop
        }
    }

    func gameStart() {
        gameHandler.shuffleCards()
        gameHandler.addListener(listener: self)
    }
    func gameOver() {
        delegate?.gameOverShouldShouldShowResult()
    }
    
    func currentLifeLines() -> Int {
        return gameHandler.lifeLineCheck()
    }
}

extension GameViewModel: CardGameHandlerListener {
    func lifeLineStatusDidChanged() {
        if gameHandler.lifeLineCheck() > 0 {
            state.value = .lifeLineReduce
        }
    }
}

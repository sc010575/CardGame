//
//  GameViewModel.swift
//  CardGame
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import Foundation

enum GameState {
    case notStarted,cotinue, stop
}

protocol GameViewModelUseCase {
    var state:Observer<GameState> { get set}
    var delegate: CardShowCaseCoordinatorDelegate? { get set}
    func title() -> String
    func showCurrentChoice() -> Card?
    func handleHighOrLow(_ input:Bool)
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
    
    func handleHighOrLow(_ input:Bool){
        if gameHandler.matchOrder(input) || gameHandler.lifeLineCheck() > 0 {
            state.value = .cotinue
        }else{
            state.value = .stop
        }
    }
    
    func gameStart() {
        gameHandler.shuffleCards()
    }
    func gameOver() {
        delegate?.gameOverShouldShouldShowResult()
    }
}

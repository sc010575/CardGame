//
//  GameViewModel.swift
//  CardGame
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import Foundation


protocol GameViewModelUseCase {
    func title() -> String
    func showCurrentChoice() -> Card?
}

final class GameViewModel: GameViewModelUseCase {
    
    private let gameHandler = CardGameHandler.shared
    
    func title() -> String {
        return "Game is on going..."
    }
    
    func showCurrentChoice() -> Card? {
        return gameHandler.currentCardToShow()
    }
}

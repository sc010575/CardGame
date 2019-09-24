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
}

final class GameViewModel: GameViewModelUseCase {
    
    func title() -> String {
        return "Game is on going..."
    }
}

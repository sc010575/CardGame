//
//  ResultViewModel.swift
//  CardGame
//
//  Created by Suman Chatterjee on 25/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import Foundation

protocol ResultViewModelUseCase {
    var delegate: CardShowCaseCoordinatorDelegate? { get set}
    func showResult() -> String
    func onTapStart()
}

final class ResultViewModel: ResultViewModelUseCase {
    var delegate: CardShowCaseCoordinatorDelegate?
    private let gameHandler = CardGameHandler.shared
    
    func showResult() -> String {
        let result = "\(gameHandler.getSuccessCounter())"
        return result
    }
    
    func onTapStart() {
        gameHandler.resetHandler()
        delegate?.shouldStartNewGame()
    }
}

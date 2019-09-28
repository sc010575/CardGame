//
//  ResultViewModel.swift
//  CardGame
//
//  Created by Suman Chatterjee on 25/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import Foundation

protocol ResultViewModelCoordinatorDelegate: class
{
    func resultViewModelShouldStartNewGame(viewModel: ResultViewModel)
}


protocol ResultViewModelUseCase {
    var coordinatorDelegate: ResultViewModelCoordinatorDelegate? { get set}
    func showResult() -> String
    func onTapStart()
}

final class ResultViewModel: ResultViewModelUseCase {
    var coordinatorDelegate: ResultViewModelCoordinatorDelegate?
    private let gameHandler = CardGameHandler.shared
    
    func showResult() -> String {
        let result = "\(gameHandler.getSuccessCounter())"
        return result
    }
    
    func onTapStart() {
        gameHandler.resetHandler()
        coordinatorDelegate?.resultViewModelShouldStartNewGame(viewModel:self)
    }
}

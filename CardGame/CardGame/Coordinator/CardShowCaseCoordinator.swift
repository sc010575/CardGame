//
//  CardShowCaseCoordinator.swift
//  CardGame
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import Foundation
import UIKit

protocol CardShowCaseCoordinatorDelegate: class
{
    func shouldStartNewGame()
    func gameOverShouldShouldShowResult()
    
}

class CardShowCaseCoordinator: Coordinator {
    private let presenter:UINavigationController
    private var startViewController:StartViewController?
    private (set) var viewModel: StartViewModelUseCase?

    init(_ presenter:UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: String(describing: StartViewController.self)) as? StartViewController else { return }
        
        var viewModel:StartViewModelUseCase = StartViewModel()
        viewModel.delegate = self
        vc.viewModel = viewModel
        presenter.pushViewController(vc, animated: true)
        self.startViewController = vc
    }
}

extension CardShowCaseCoordinator: CardShowCaseCoordinatorDelegate {
    
    func shouldStartNewGame() {
        startNewGame()
    }

    func gameOverShouldShouldShowResult() {
    
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: String(describing: ResultViewController.self)) as? ResultViewController else { return }
        
        var viewModel:ResultViewModelUseCase = ResultViewModel()
        viewModel.delegate = self
        vc.viewModel = viewModel
        presenter.pushViewController(vc, animated: true)

    }
    
    fileprivate func startNewGame(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: String(describing: GameViewController.self)) as? GameViewController else { return }
        
        var viewModel:GameViewModelUseCase = GameViewModel()
        viewModel.delegate = self
        vc.viewModel = viewModel
        presenter.pushViewController(vc, animated: true)

    }
}

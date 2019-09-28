//
//  GameCoordinator.swift
//  CardGame
//
//  Created by Suman Chatterjee on 28/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import UIKit

protocol GameCoordinatorDelegate: class {
    func gameCoordinatorShouldShowResult(_ coordinator: GameCoordinator)
    
}

class GameCoordinator: Coordinator {
    
    private var presenter: UINavigationController
    weak var delegate: GameCoordinatorDelegate?
    
    init(_ presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: String(describing: GameViewController.self)) as? GameViewController else { return }
        
        var viewModel: GameViewModelUseCase = GameViewModel()
        viewModel.coordinatorDelegate = self
        vc.viewModel = viewModel
        presenter.pushViewController(vc, animated: true)
    }
    
}

extension GameCoordinator: GameViewModelCoordinatorDelegate {
    func gameViewModelDidFinishGame(viewModel: GameViewModel) {
        delegate?.gameCoordinatorShouldShowResult(self)
    }
}


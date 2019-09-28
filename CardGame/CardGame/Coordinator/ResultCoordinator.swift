//
//  ResultCoordinator.swift
//  CardGame
//
//  Created by Suman Chatterjee on 28/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import UIKit

protocol ResultCoordinatorDelegate: class {
    func resultCoordinatorShouldStartNewGame(_ coordinator:Coordinator)
}


class ResultCoordinator: Coordinator {
    
    private var presenter: UINavigationController
    weak var delegate: ResultCoordinatorDelegate?
    
    init(_ presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: String(describing: ResultViewController.self)) as? ResultViewController else { return }
        
        var viewModel: ResultViewModelUseCase = ResultViewModel()
        viewModel.coordinatorDelegate = self
        vc.viewModel = viewModel
        presenter.pushViewController(vc, animated: true)
    }
}

extension ResultCoordinator: ResultViewModelCoordinatorDelegate {
    func resultViewModelShouldStartNewGame(viewModel: ResultViewModel) {
        delegate?.resultCoordinatorShouldStartNewGame(self)
    }
}


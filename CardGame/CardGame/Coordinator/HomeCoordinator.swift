//
//  CardShowCaseCoordinator.swift
//  CardGame
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import Foundation
import UIKit

protocol HomeCoordinatorDelegate: class
{
    func gameCoordinatorshouldStartNewGame(_ coordinator: HomeCoordinator)
}

class HomeCoordinator: Coordinator {
    private let presenter: UINavigationController
    weak var delegate: HomeCoordinatorDelegate?

    init(_ presenter: UINavigationController) {
        self.presenter = presenter
    }

    func start() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: String(describing: StartViewController.self)) as? StartViewController else { return }

        var viewModel: StartViewModelUseCase = StartViewModel()
        viewModel.coordinatorDelegate = self
        vc.viewModel = viewModel
        presenter.pushViewController(vc, animated: true)
    }
}

extension HomeCoordinator: StartViewModelCoordinatorDelegate {
    func startViewModelShouldStartNewGame(viewModel: StartViewModel) {
        delegate?.gameCoordinatorshouldStartNewGame(self)
    }
}

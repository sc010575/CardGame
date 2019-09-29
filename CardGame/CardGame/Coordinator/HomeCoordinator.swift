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

class HomeCoordinator: Coordinator, DataItemProtocol {
    
    typealias FrameViewModel = StartViewModel.DataItem
    private let presenter: UINavigationController
    weak var delegate: HomeCoordinatorDelegate?

    init(_ presenter: UINavigationController) {
        self.presenter = presenter
    }

    func start() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: String(describing: StartViewController.self)) as? StartViewController else { return }
        let dataItem = makeViewModel()

        var viewModel: StartViewModelUseCase = StartViewModel(dataItem: dataItem)
        viewModel.coordinatorDelegate = self
        vc.viewModel = viewModel
        presenter.pushViewController(vc, animated: true)
    }
    
    func makeViewModel() -> FrameViewModel {

        let dataItem = FrameViewModel(title: "Card Higher or Lower game", gameTitle: "Welcome to Higher or Lower!", description: "Tap the start button to start a game  with  shuffled card. \n 😊 " )
        return dataItem
    }
}

extension HomeCoordinator: StartViewModelCoordinatorDelegate {
    func startViewModelShouldStartNewGame(viewModel: StartViewModel) {
        delegate?.gameCoordinatorshouldStartNewGame(self)
    }
}

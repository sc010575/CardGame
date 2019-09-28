//
//  ApplicationCoordinator.swift
//  CardGame
//
//  Created by Suman Chatterjee on 28/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
    enum CoordinatorKeys: String {
        case start
        case game
        case result
    }
    
    private let window: UIWindow
    private let navigationcontroller: UINavigationController
    private var coordinators = [String: Coordinator]()
    
    init(_ window: UIWindow) {
        self.window = window
        navigationcontroller = UINavigationController()
    }
    
    func start() {
        window.rootViewController = navigationcontroller
        startNewGame()
        window.makeKeyAndVisible()
    }
    
    fileprivate func startNewGame() {
        let startGameCoordinator = HomeCoordinator(navigationcontroller)
        startGameCoordinator.delegate = self
        coordinators[CoordinatorKeys.start.rawValue] = startGameCoordinator
        startGameCoordinator.start()
    }
}


extension ApplicationCoordinator: HomeCoordinatorDelegate {
    
    func gameCoordinatorshouldStartNewGame(_ coordinator: HomeCoordinator) {
        let gameCoordinator = GameCoordinator(navigationcontroller)
        gameCoordinator.delegate = self
        coordinators[CoordinatorKeys.game.rawValue] = gameCoordinator
        gameCoordinator.start()
    }
}

extension ApplicationCoordinator: GameCoordinatorDelegate {
    func gameCoordinatorShouldShowResult(_ coordinator: GameCoordinator) {
        if let resultCoordinator = coordinators[CoordinatorKeys.result.rawValue] as? ResultCoordinator {
            resultCoordinator.start()
        } else {
            let resultCoordinator = ResultCoordinator(navigationcontroller)
            resultCoordinator.delegate = self
            coordinators[CoordinatorKeys.result.rawValue] = resultCoordinator
            resultCoordinator.start()
        }
    }
}

extension ApplicationCoordinator: ResultCoordinatorDelegate {
    func resultCoordinatorShouldStartNewGame(_ coordinator: Coordinator) {
        if let gameCoordinator = coordinators[CoordinatorKeys.game.rawValue] as? GameCoordinator {
            gameCoordinator.start()
        } else {
            startNewGame()
        }
    }
}

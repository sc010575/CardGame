//
//  Coordinator.swift
//  CakeShowCase
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    func start()
}


class ApplicationCoordinator:Coordinator {
    
    private let window: UIWindow
    private let navigationcontroller:UINavigationController
    private let cardShowCaseCoordinator: CardShowCaseCoordinator
    
    init(_ window:UIWindow) {
        self.window = window
        navigationcontroller = UINavigationController()
        cardShowCaseCoordinator = CardShowCaseCoordinator(navigationcontroller)
    }
    
    func start() {
        window.rootViewController = navigationcontroller
        cardShowCaseCoordinator.start()
        window.makeKeyAndVisible()
    }
}

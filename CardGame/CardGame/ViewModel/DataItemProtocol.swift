//
//  DataItemProtocol.swift
//  CardGame
//
//  Created by Suman Chatterjee on 29/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import Foundation

// A protocol that defines a coordinator's ability to make a view model.
protocol DataItemProtocol {
    associatedtype FrameViewModel: ViewModelProtocol
    func makeViewModel() -> FrameViewModel
}

// An empty protocol used to capture the type of the view model.
protocol ViewModelProtocol { }


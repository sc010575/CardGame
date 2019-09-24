//
//  GameViewController.swift
//  CardGame
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
 
    var viewModel:GameViewModelUseCase!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title()
    }
}

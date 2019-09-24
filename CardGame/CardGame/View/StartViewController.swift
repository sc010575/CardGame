//
//  ViewController.swift
//  CardGame
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    var viewModel: StartViewModelUseCase!

    @IBOutlet weak var gameStartButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title()
        viewModel.fetchCards()
    }
    @IBAction func onTapgameStartButton(_ sender: Any) {
        viewModel.onTapStart()
    }
}


//
//  ResultViewController.swift
//  CardGame
//
//  Created by Suman Chatterjee on 25/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!

    var viewModel: ResultViewModelUseCase!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItems = []
        navigationItem.hidesBackButton = true
        resultLabel.text = viewModel.showResult()
    }

    @IBAction func onTapStartButton(_ sender: Any) {
        viewModel.onTapStart()
    }
}

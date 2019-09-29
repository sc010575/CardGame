//
//  ViewController.swift
//  CardGame
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var gameStartButton: UIButton!
    
    var viewModel: StartViewModelUseCase!

    override func viewDidLoad() {
        super.viewDidLoad()
        populateFields()
        gameStartButton.isEnabled = false
        viewModel.fetchCards()
        viewModel.state.bind { (state) in
            switch state {
            case .canStartNewGame:
                self.gameStartButton.isEnabled = true
            case .fetchDataError:
                print("Fatching data error")
            case .dataNotInitiated:
                break
            }
        }
    }
    @IBAction func onTapgameStartButton(_ sender: Any) {
        viewModel.onTapStart()
    }
    
    fileprivate func populateFields() {
        
        guard let dataItem = viewModel.dataItemToShow() as? StartViewModel.DataItem else { return }
        titleLabel.text  = dataItem.gameTitle
        descriptionLabel.text = dataItem.description
        title = dataItem.title
    }
}


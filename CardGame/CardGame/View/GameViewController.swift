//
//  GameViewController.swift
//  CardGame
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var higherButton: UIButton!
    @IBOutlet weak var lowerButton: UIButton!
    @IBOutlet weak var cardView: CardView!

    @IBOutlet weak var lifeLineView: LifeLineView!
    var viewModel: GameViewModelUseCase!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title()
        navigationItem.leftBarButtonItems = []
        navigationItem.hidesBackButton = true
        viewModel.gameStart()
        setupCardView()
        viewModel.state.bind { gameState in

            switch gameState {
            case .stop:
                self.updateLifelineView()
                self.viewModel.gameOver()
            case .lifeLineReduce:
                self.updateLifelineView()
            default:
                break
            }
        }
    }

    @IBAction func onTapHigher(_ sender: Any) {
        viewModel.handleHighOrLow(true)
        setupCardView()

    }
    @IBAction func onTapLower(_ sender: Any) {
        viewModel.handleHighOrLow(false)
        setupCardView()
    }

    fileprivate func setupCardView() {
        guard let cardToShow = viewModel.showCurrentChoice() else { return }
        cardView.currentCardToShow(cardToShow)
    }

    fileprivate func updateLifelineView() {
        let currentLifeLines = viewModel.currentLifeLines()
        lifeLineView.updateLifeLine(currentLifeLines)
    }
}

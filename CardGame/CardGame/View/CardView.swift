//
//  CardView.swift
//  CardGame
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    private var cardToShow:Card? {
        didSet{
            valueLabel.text = cardToShow?.value
            suitLabel.text = cardToShow?.suit
        }
    }

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var suitLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    func setup() {
        layer.cornerRadius = 8.0
        layer.masksToBounds = true
    }
    
    func currentCardToShow(_ card:Card) {
        cardToShow = card
    }
}

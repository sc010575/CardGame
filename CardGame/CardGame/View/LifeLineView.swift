//
//  LifeLineView.swift
//  CardGame
//
//  Created by Suman Chatterjee on 25/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import UIKit

class LifeLineView: UIView {

    @IBOutlet var lifeLineViews: [UIView]! {
        didSet {
            lifeLineViews.forEach { createCircle(view: $0)
            }
        }
    }

    fileprivate func createCircle(view: UIView) {
        view.layer.cornerRadius = view.bounds.size.width / 2
        view.layer.masksToBounds = true
        view.backgroundColor = .green
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateLifeLine(_ num: Int) {
        lifeLineViews.forEach {
            if $0.tag == num {
                $0.backgroundColor = .red
            }
        }
    }
}

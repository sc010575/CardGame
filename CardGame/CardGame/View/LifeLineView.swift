//
//  LifeLineView.swift
//  CardGame
//
//  Created by Suman Chatterjee on 25/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import UIKit

class LifeLineView: UIView {

    @IBOutlet weak var lifeLine1View: UIView!{
        didSet{
            createCircle(view: lifeLine1View)
        }
    }
    @IBOutlet weak var lifeLine2View: UIView!{
        didSet{
            createCircle(view: lifeLine2View)
        }
    }
    @IBOutlet weak var lifeLine3View: UIView!{
        didSet{
            createCircle(view: lifeLine3View)
        }
    }

    fileprivate func createCircle(view:UIView) {
        view.layer.cornerRadius = view.bounds.size.width/2
        view.layer.masksToBounds = true
        view.backgroundColor = .darkGray
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

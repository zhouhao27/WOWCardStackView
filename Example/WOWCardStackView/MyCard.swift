//
//  MyCard.swift
//  CardStack
//
//  Created by Zhou Hao on 11/3/17.
//  Copyright © 2017 Zhou Hao. All rights reserved.
//

import UIKit
import WOWCardStackView

class MyCard: CardView {
    @IBOutlet weak var numberLabel: UILabel!
 
    var id: Int

    init(id: Int) {
        self.id = id
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.id = 0
        super.init(coder: aDecoder)
    }
    
}

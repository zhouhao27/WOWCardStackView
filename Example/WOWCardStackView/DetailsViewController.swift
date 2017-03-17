//
//  DetailsViewController.swift
//  WOWCardStackView
//
//  Created by Zhou Hao on 17/3/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import WOWCardStackView

class DetailsViewController: UIViewController, CardStackViewDataSource {

    @IBOutlet weak var cardStackView: CardStackView!
    var id: Int!
    var orderNo: Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "\(id!)"
        
        cardStackView.register(nib: UINib(nibName: "MyCard", bundle: nil))
        cardStackView.dataSource = self        

    }

    func nextCard(in: CardStackView) -> CardView? {
        let card = cardStackView.dequeueCardView() as! MyCard
        card.numberLabel.text = "\(orderNo)"
        orderNo += 1
        return card
    }
    
    func cardStackView(_ cardStackView: CardStackView, cardAt index: Int) -> CardView {
        let card = cardStackView.dequeueCardView() as! MyCard
        card.numberLabel.text = "\(index)"
        return card
    }
    
    func numOfCardInStackView(_ cardStackView: CardStackView) -> Int {
        return 5
    }
    
}

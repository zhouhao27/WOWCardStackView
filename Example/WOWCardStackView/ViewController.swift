//
//  ViewController.swift
//  CardStack
//
//  Created by Zhou Hao on 11/3/17.
//  Copyright © 2017 Zhou Hao. All rights reserved.
//

import UIKit
import WOWCardStackView

class ViewController: UIViewController, CardStackViewDataSource {

    @IBOutlet weak var cardStackView: CardStackView!
    var orderNo: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardStackView.register(nib: UINib(nibName: "MyCard", bundle: nil))
        cardStackView.dataSource = self
        cardStackView.reloadData()
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
        return 3
    }

}


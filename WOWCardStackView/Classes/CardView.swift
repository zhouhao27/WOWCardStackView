//
//  CardView.swift
//  CardStack
//
//  Created by Zhou Hao on 11/3/17.
//  Copyright © 2017 Zhou Hao. All rights reserved.
//

import UIKit

public protocol CardViewDelegate: class {
    func shouldRemoveCardView(_ cardView: CardView)
}

@IBDesignable
open class CardView: UIView {
    
    private var originCenter: CGPoint!

    weak var delegate: CardViewDelegate?
    
    @IBInspectable
    public var borderColor: UIColor = UIColor.clear {
        willSet {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat = 0 {
        willSet {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    public var isShadowed: Bool = false {
        willSet {
            if newValue {
                self.layer.shadowColor = UIColor.black.cgColor
                self.layer.shadowOpacity = 0.6
                self.layer.shadowOffset = CGSize.zero
                self.layer.shadowRadius = 5
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(drag(gesture:)))
        self.addGestureRecognizer(gesture)
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        originCenter = self.center
    }

    func drag(gesture: UIPanGestureRecognizer) {
        
        guard isTopMost() else {
            return
        }
        
        let translation = gesture.translation(in: self)

        if gesture.state == .ended {
            
            if abs(translation.x) > bounds.width / 2.0 || abs(translation.y) > bounds.height / 2.0 {
                delegate?.shouldRemoveCardView(self)
                
                // TODO:  better animation
//                UIView.animate(withDuration: 0.5, animations: {
//                    self.center = CGPoint(x:-1000, y: 0)
//                }, completion: { (complete) in
//                    self.removeFromSuperview()
//                })
                
                self.removeFromSuperview()
            } else {
                // return back to original position
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
                    self.center = self.originCenter
                }, completion: { (complete) in
                })
            }
            return
        }
        
        self.center = CGPoint(x: originCenter.x + translation.x, y: originCenter.y + translation.y)
    }
    
    //MARK: - Private
    func isTopMost() -> Bool {
        return self.superview?.subviews.last == self
    }
    
}

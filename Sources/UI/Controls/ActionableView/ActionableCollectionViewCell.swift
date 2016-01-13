//
//  ActionableCollectionViewCell.swift
//  Workouter
//
//  Created by Uladzimir Papko on 1/9/16.
//  Copyright © 2016 visput. All rights reserved.
//

import UIKit

class ActionableCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet private(set) weak var actionsContentView: UIView!
    
    @IBOutlet private(set) weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
            
            let tapRecognizer = UITapGestureRecognizer(target: self, action: Selector("scrollViewDidTap:"))
            scrollView.addGestureRecognizer(tapRecognizer)
        }
    }
    
    var didSelectAction: (() -> Void)?
    
    var contentOffsetToMakeActionsVisible: CGFloat = 50.0
    
    var actionsEnabled: Bool = true {
        didSet {
            if actionsVisible {
                actionsVisible = false
            }
            scrollView.scrollEnabled = actionsEnabled
        }
    }
    
    var actionsVisible: Bool = false {
        didSet {
            if actionsVisible {
                
                // Shift scroll view frame to expand action items.
                UIView.animateWithDuration(1.0,
                    delay: 0.0,
                    usingSpringWithDamping: 0.7,
                    initialSpringVelocity: 2.0,
                    options: [.CurveEaseIn],
                    animations: {
                        self.scrollView.frame.origin.x = -self.actionsContentView.frame.size.width
                    }, completion: nil)
                
            } else {
                
                // Shift scroll view frame to collapse action items.
                UIView.animateWithDuration(0.8,
                    delay: 0.0,
                    usingSpringWithDamping: 1.0,
                    initialSpringVelocity: 1.0,
                    options: [.CurveEaseIn],
                    animations: {
                        self.scrollView.frame.origin.x = 0.0
                    }, completion: nil)
            }
        }
    }
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        if actionsVisible && CGRectContainsPoint(scrollView.frame, point) {
            actionsVisible = false
            return nil
        } else {
            return super.hitTest(point, withEvent: event)
        }
    }
    
    func setActionsOverlayOffset(offset: CGFloat) {
        UIView.animateWithDuration(0.8,
            delay: 0.0,
            usingSpringWithDamping: 1.0,
            initialSpringVelocity: 1.0,
            options: [.CurveEaseIn],
            animations: {
                self.scrollView.frame.origin.x = -offset
            }, completion: nil)
    }
    
    @objc private func scrollViewDidTap(gesture: UITapGestureRecognizer) {
        selected = true
        didSelectAction?()
    }
}

extension ActionableCollectionViewCell: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        // Allow scrolling only in left direction.
        if scrollView.contentOffset.x > 0 {
            scrollView.contentOffset.y = 0
        } else {
            scrollView.contentOffset.x = 0
            scrollView.contentOffset.y = 0
        }
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            
            if scrollView.contentOffset.x >= contentOffsetToMakeActionsVisible {
                actionsVisible = true
            }
    }
}

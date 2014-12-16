//
//  LoadingView.swift
//  Duals
//
//  Created by ncurtis on 12/15/14.
//  Copyright (c) 2014 noelcurtis. All rights reserved.
//

import UIKit

class LoadingView : UIView {
    
    @IBOutlet weak var loaderCircleImageView: UIImageView!
    @IBOutlet weak var loaderTitleImageView: UIImageView!

    let fullRotation = CGFloat(M_PI * 2)
    let duration = 2.0
    let delay = 0.0
    let options = UIViewKeyframeAnimationOptions.CalculationModePaced
    var isStopped = true
    
    func startAnimating() {
        self.isStopped = false
        self.loaderCircleImageView.layer.anchorPoint = CGPoint(x: 0.50, y: 0.524)
        animate()
    }
    
    func animate() {
        if(isStopped) {
            return
        } else {
            UIView.animateKeyframesWithDuration(duration, delay: delay, options: options, animations: {
                
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                    self.loaderCircleImageView.transform = CGAffineTransformMakeRotation(1/3 * self.fullRotation)
                })
                
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                    self.loaderCircleImageView.transform = CGAffineTransformMakeRotation(2/3 * self.fullRotation)
                })
                
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                    self.loaderCircleImageView.transform = CGAffineTransformMakeRotation(3/3 * self.fullRotation)
                })
                
                }, completion: {(finished) -> Void in
                    self.animate()
            })

        }
    }
    
    func stopAnimating() {
        self.isStopped = true
    }
    
}

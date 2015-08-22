//
//  CircleTransitionAnimator.swift
//  VCTransitionAnimation
//
//  Created by Mohsin on 25/06/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit


protocol Container {
    typealias ItemType
    
}

class CircleTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    weak var transitionContext: UIViewControllerContextTransitioning?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval{
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        //1
        self.transitionContext = transitionContext
        
        
        //2
        var containerView = transitionContext.containerView()
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        var transitionView = (fromViewController as! CircleTransitionProtocol).pointOfAnimation
        
        //3
        containerView.addSubview(toViewController!.view)
        
        //4
        var circleMaskPathInitial = UIBezierPath(ovalInRect: transitionView.frame)
        var extremePoint = CGPoint(x: transitionView.center.x - 0, y: transitionView.center.y - CGRectGetHeight(toViewController!.view.bounds))
        var radius = sqrt((extremePoint.x*extremePoint.x) + (extremePoint.y*extremePoint.y))
        var circleMaskPathFinal = UIBezierPath(ovalInRect: CGRectInset(transitionView.frame, -radius, -radius))
        
        //5
        var maskLayer = CAShapeLayer()
        maskLayer.path = circleMaskPathFinal.CGPath
        toViewController!.view.layer.mask = maskLayer
        
        //6
        var maskLayerAnimation = CAKeyframeAnimation(keyPath: "path")

//        maskLayerAnimation.fromValue = circleMaskPathInitial.CGPath
//        maskLayerAnimation.toValue = circleMaskPathFinal.CGPath
        
        maskLayerAnimation.values = [circleMaskPathInitial.CGPath, circleMaskPathFinal.CGPath]

        maskLayerAnimation.duration = self.transitionDuration(transitionContext)
        maskLayerAnimation.delegate = self
        maskLayer.addAnimation(maskLayerAnimation, forKey: "path")
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        
        self.transitionContext?.completeTransition(!self.transitionContext!.transitionWasCancelled())
        self.transitionContext?.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view.layer.mask = nil
    }
}

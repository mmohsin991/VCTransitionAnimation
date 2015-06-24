//
//  NavigationControllerDelegate.swift
//  VCTransitionAnimation
//
//  Created by Mohsin on 25/06/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return CircleTransitionAnimator()
    }
}
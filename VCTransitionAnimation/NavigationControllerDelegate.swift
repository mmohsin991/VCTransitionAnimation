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



extension UIViewController{
    var myTransitionView : UIView {
        get{
            return MyTransitionView.myTransitionView
        }
        set{
            MyTransitionView.myTransitionView = newValue
        }
    }
}

struct MyTransitionView{
    static var myTransitionView = UIView()
}
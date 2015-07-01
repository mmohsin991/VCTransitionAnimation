//
//  VC2.swift
//  VCTransitionAnimation
//
//  Created by Mohsin on 01/07/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class VC2: UIViewController,
            CircleTransitionProtocol {

    @IBOutlet weak var button: UIButton!

    
    @IBAction func circleTapped(sender:UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    // implement CircleTransitionProtocol
    var pointOfAnimation: UIView {
        get {
            return button
        }
    }
    
    @IBAction func printLn(sender: UIButton) {
        println("VC2 printLn")
    }
    
}
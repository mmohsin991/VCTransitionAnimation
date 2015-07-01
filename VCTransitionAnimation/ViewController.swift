//
//  ViewController.swift
//  VCTransitionAnimation
//
//  Created by Mohsin on 24/06/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//



import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        
        super.myTransitionView = self.button
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func circleTapped(sender:UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}


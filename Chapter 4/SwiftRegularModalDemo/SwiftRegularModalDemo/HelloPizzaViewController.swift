//
//  HelloPizzaViewController.swift
//  SwiftRegularModalDemo
//
//  Created by Steven Lipton on 12/10/15.
//  Copyright © 2015 MakeAppPie.Com. All rights reserved.
//

import UIKit

class HelloPizzaViewController: UIViewController {

   
    @IBAction func didFinishPizza(sender: UIButton) {
        dismissViewControllerAnimated(true,
            completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

//
//  PizzaViewController.swift
//  SwiftPizzaPopoverDemo
//
//  Created by Steven Lipton on 2/25/15.
//  Copyright (c) 2015 MakeAppPie.Com. All rights reserved.
//

import UIKit

class PizzaViewController: UIViewController {
    //MARK: Properties
    var sizeClass = UITraitCollection()
    
    //MARK: Outlets
    
    @IBOutlet weak var pizzaDone: UIButton!
    
    //MARK: Actions
    @IBAction func pizzaDone(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil )
    }
    //MARK: Life Cycle
    override func viewWillAppear(animated: Bool) {
        pizzaDone.hidden =
            (sizeClass.horizontalSizeClass == .Regular) &&
            (sizeClass.verticalSizeClass == .Regular)
    }
}
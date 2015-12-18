//
//  ThreeViewController.swift
//  SwiftProgNavControllerDemo
//
//  Created by Steven Lipton on 1/25/15.
//  Revised 12/15/15 Swift 2.1
//  Copyright (c) 2015 MakeAppPie.Com. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {
    
    @IBAction func rootButton(sender: UIButton) {
        navigationController?.popToRootViewControllerAnimated(true )
        
    }
    
    @IBAction func backButton(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true )
    }
}
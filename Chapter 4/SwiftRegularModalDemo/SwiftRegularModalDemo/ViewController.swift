//
//  ViewController.swift
//  SwiftRegularModalDemo
//
//  Created by Steven Lipton on 12/10/15.
//  Copyright © 2015 MakeAppPie.Com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func presentModal(sender: UIButton) {
        let helloPizzaVC =
        storyboard?.instantiateViewControllerWithIdentifier(
            "PizzaModal")
            as! HelloPizzaViewController  //1
        //helloPizzaVC.modalPresentationStyle = .PageSheet
//        helloPizzaVC.modalPresentationStyle = .FormSheet
//        helloPizzaVC.preferredContentSize = CGSizeMake(400.0, 400.0)
        if self.traitCollection.userInterfaceIdiom == .Phone{
            helloPizzaVC.modalPresentationStyle = .FullScreen
        }
        else{
            helloPizzaVC.modalPresentationStyle = .FormSheet
            helloPizzaVC.preferredContentSize =
                CGSizeMake(400.0,400.0)
        }
        
        presentViewController(helloPizzaVC,
            animated: true,completion: nil) //2

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }



}


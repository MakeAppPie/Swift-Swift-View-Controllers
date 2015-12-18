//  ViewController.swift
//  SwiftPizzaPopoverDemo
//
//  Created by Steven Lipton on 2/25/15.
//  Copyright (c) 2015 MakeAppPie.Com. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    //MARK: Properties
    let modalVC = PizzaViewController(
        nibName:"PizzaViewController", bundle:nil)
    //MARK:  - Actions
    @IBAction func popoverButton(sender: UIButton) {
        modalVC.modalPresentationStyle = .Popover//2
        modalVC.sizeClass = traitCollection
        presentViewController(modalVC,
            animated: true, completion: nil)//3
        modalVC.popoverPresentationController?.sourceView = view//4
        modalVC.popoverPresentationController?.sourceRect = sender.frame//5
        
    }
    @IBAction func barButtonPopover(sender: UIBarButtonItem) {
        dismissCurrentModal(animated: true)
        modalVC.modalPresentationStyle = .Popover
        modalVC.sizeClass = traitCollection
        presentViewController(modalVC, animated: true, completion: nil)
        modalVC.popoverPresentationController?.barButtonItem = sender//4
    }
    //MARK: - Instance Methods
    func dismissCurrentModal(animated animated:Bool){
        let pvc = presentedViewController
        if pvc != nil { //dismiss if present
            pvc?.dismissViewControllerAnimated(
                animated,
                completion: nil
            )
        }
    }
    func widthClass()->UIUserInterfaceSizeClass{
        return self.traitCollection.horizontalSizeClass
    }
    //MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "Coffee Popover"){
            dismissCurrentModal(animated: false)
            let vc = segue.destinationViewController as! PizzaViewController
            vc.sizeClass = traitCollection
        }
    }
}

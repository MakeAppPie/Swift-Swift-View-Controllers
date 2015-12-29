//
//  FullMenuViewController.swift
//  SwiftTableViewDemo
//
//  Created by Steven Lipton on 3/5/15.
//  Revised 12/28/15 for Swift 2.1
//  Copyright © 2015 MakeAppPie.Com. All rights reserved.
//

import UIKit

class FullMenuViewController: UITableViewController,MenuItemSelectionDelegate {
    //MARK: Properties and Outlets
    let dessertSection = 1
    let iceCreamRow = 1
    var myOrder = OrderModel()
    var delegate:MenuItemSelectionDelegate! = nil
    //MARK: Actions
    
    @IBAction func saveButton(sender: UIBarButtonItem) {
        delegate.didSelectMenuItem(self, order: myOrder)
    }
    
    //MARK: Table View Delegates and Data Sources
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == dessertSection{
            if indexPath.row == iceCreamRow{
                performSegueWithIdentifier("Ice Cream", sender: self)
            }else{
                performSegueWithIdentifier("Pie", sender: self)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        enum  sections:Int{
            case Pizza = 0, DeepDish, Calzone
        }
        if segue.identifier == "Pizza"{
            let vc = segue.destinationViewController as! PizzaMenuTableViewController
            vc.delegate = self
            vc.gotoSection = sections.Pizza.rawValue
        }
        if segue.identifier == "Deep Dish"{
            let vc = segue.destinationViewController as! PizzaMenuTableViewController
            vc.delegate = self
            vc.gotoSection = sections.DeepDish.rawValue
        }
        if segue.identifier == "Calzone"{
            let vc = segue.destinationViewController as! PizzaMenuTableViewController
            vc.delegate = self
            vc.gotoSection = sections.Calzone.rawValue
        }
    }
    
    func didSelectMenuItem(controller: UITableViewController, order: OrderModel) {
        myOrder = order
        navigationItem.title = order.menuItem
        controller.navigationController?.popViewControllerAnimated(true)
    }
    

}

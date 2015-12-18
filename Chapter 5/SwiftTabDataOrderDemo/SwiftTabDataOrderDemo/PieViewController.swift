//
//  PieViewController.swift
//  SwiftTabDataOrderDemo
//
//  Created by Steven Lipton on 3/1/15.
//  Copyright (c) 2015 MakeAppPie.Com. All rights reserved.
//

import UIKit

class PieViewController: UIViewController{
    var myOrder = OrderModel()
    // MARK: - Target Actions
    
    @IBOutlet weak var orderLabel: UILabel!
    
    @IBAction func orderButton(sender: UIButton) {
        myOrder.pie = (sender.titleLabel?.text)!
        orderLabel.text = myOrder.currentOrder()
    }
    //MARK: - Life Cycle
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        orderLabel.text = myOrder.currentOrder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Commented out code is the first version of sharing
        //Data
        
        //let barViewControllers = self.tabBarController?.viewControllers
        //let svc = barViewControllers![1] as! PizzaViewController //20
        //svc.myOrder = self.myOrder  //shared model
        let tbc = self.tabBarController as! OrderTabController
        myOrder = tbc.myOrder
    }
}
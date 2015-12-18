//
//  PizzaViewController.swift
//  SwiftTabDataOrderDemo
//
//  Created by Steven Lipton on 3/2/15.
//  Copyright (c) 2015 MakeAppPie.Com. All rights reserved.
//

import UIKit

class PizzaViewController: UIViewController {
    var myOrder = OrderModel()
    @IBOutlet weak var orderLabel: UILabel!
    
    @IBAction func orderButton(sender: UIButton) {
        myOrder.pizza = (sender.titleLabel?.text)!
        orderLabel.text = myOrder.currentOrder()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        orderLabel.text = myOrder.currentOrder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tbvc = self.tabBarController  as! OrderTabController
        myOrder = tbvc.myOrder
    }
    
}
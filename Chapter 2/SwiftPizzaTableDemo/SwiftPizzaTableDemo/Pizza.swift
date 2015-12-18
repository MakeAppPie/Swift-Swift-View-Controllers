//
//  Pizza.swift
//  SwiftPizzaTableDemo
//
//  Created by Steven Lipton on 9/25/15.
//  Copyright © 2015 Steven Lipton. All rights reserved.
//

import UIKit
class Pizza {
    var pizzaPricePerInSq = ["Cheese": 0.03 ,
        "Sausage": 0.06 ,
        "Pepperoni": 0.05 ,
        "Veggie": 0.04]
    
    let pi = 3.1415926
    var diameter = 0.0
    var pizzaType = "Cheese"
    
    var radius : Double {
        get{
            return diameter/2.0
        }
    }
    
 
    var typeList:[String] {
        get{
            return Array(pizzaPricePerInSq.keys)
        }
    }
 
    
    func pizzaArea() -> Double{
        return radius * radius * pi
    }
    func unitPrice() -> Double{
        if let unitPrice = pizzaPricePerInSq[pizzaType]{
            return unitPrice
        }
        else {
            return 0.0
        }
    }
    func pizzaPrice() -> Double{
        return pizzaArea() * unitPrice()
    }
    


}
//
//  Pizza.swift
//  SwiftPizzaTableDemo
//
//  Created by Steven Lipton on 9/25/15.
//  Copyright © 2015 Steven Lipton. All rights reserved.
//
// github edited file
// The basic model for exercises in this chapter. 
import UIKit
class Pizza {
//MARK: Properties
    var pizzaPricePerInSq = ["Cheese": 0.03 ,
        "Sausage": 0.06 ,
        "Pepperoni": 0.05 ,
        "Veggie": 0.04]
    
    let pi = 3.1415926
    var diameter = 0.0
    var pizzaType = "Cheese"
 //MARK: Computed properties   
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
 
    //MARK: - Instance Methods 
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

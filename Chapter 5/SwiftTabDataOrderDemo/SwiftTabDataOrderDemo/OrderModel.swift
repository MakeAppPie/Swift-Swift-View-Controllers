//
//  OrderModel.swift
//  SwiftTabDataOrderDemo
//
//  Created by Steven Lipton on 3/2/15.
//  Copyright (c) 2015 MakeAppPie.Com. All rights reserved.
//

import UIKit

class OrderModel{
    var pizza:String = "No"
    var pie:String = "No"
    
    func currentOrder() -> String{
        //return a string with the current order
        return pizza + " pizza and " + pie + " pie"
    }
}

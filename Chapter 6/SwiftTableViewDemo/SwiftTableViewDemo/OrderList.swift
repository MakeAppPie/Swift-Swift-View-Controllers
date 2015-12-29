//
//  OrderList.swift
//  SwiftTableViewDemo
//
//  Created by Steven Lipton on 12/29/15.
//  Copyright © 2015 MakeAppPie.Com. All rights reserved.
//

import UIKit
class OrderList :NSObject{
    var list:[OrderModel] = []
    func addList(model:OrderModel){
        list = list + [model]
    }
}
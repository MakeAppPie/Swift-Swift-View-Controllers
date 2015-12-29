//
//  MenuItems.swift
//  SwiftTableViewDemo
//
//  Created by Steven Lipton on 12/28/15.
//  Copyright © 2015 MakeAppPie.Com. All rights reserved.
//

import UIKit
// The Basic Menu Items List
class MenuItems: NSObject {
    var sections:[String] = []
    var items:[[String]] = []
    
    func addSection(section:String, item:[String]){
        sections = sections + [section]
        items = items + [item]
    }

}
// The Pizza Menu Items
// We initialize this class with the necessary data
class PizzaMenuItems: MenuItems{
    override init() {
        super.init()
        addSection("Pizza",
            item: [
                "Margherita","BBQ Chicken",
                "Pepperoni","Sausage","Seafood",
                "Special"])
        addSection("Deep Dish Pizza",
            item:[
                "Sausage","Meat Lover's",
                "Veggie Lover's","BBQ Chicken",
                "Mushroom","Special"])
        addSection("Calzone",
            item: [
                "Sausage","Chicken Pesto",
                "Prawns and Mushrooms","Primavera",
                "Meatball"])
    }
}

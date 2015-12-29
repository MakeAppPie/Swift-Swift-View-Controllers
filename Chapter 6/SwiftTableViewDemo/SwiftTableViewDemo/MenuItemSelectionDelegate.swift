//
//  MenuItemSelectionDelegate.swift
//  SwiftTableViewDemo
//
//  Created by Steven Lipton on 12/28/15.
//  Copyright © 2015 MakeAppPie.Com. All rights reserved.
//

import UIKit

protocol MenuItemSelectionDelegate{
    func didSelectMenuItem(controller:UITableViewController, order:OrderModel)
}
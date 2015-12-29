//
//  PizzaMenuTableViewController.swift
//  SwiftTableViewDemo
//
//  Created by Steven Lipton on 12/28/15.
//  Copyright © 2015 MakeAppPie.Com. All rights reserved.
//

import UIKit

class PizzaMenuTableViewController: UITableViewController {
    //MARK: Outlets and Properties
    var myOrder = OrderModel()
    let menuItems = PizzaMenuItems()
    var delegate:MenuItemSelectionDelegate! = nil
    var gotoSection = 0
    //MARK: - Life Cycle
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let indexPath = NSIndexPath(forRow: 0, inSection: gotoSection)
        tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Top, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: -  Table Delegates and data sources
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return menuItems.sections.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.items[section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let row = indexPath.row
        let section = indexPath.section
        cell.textLabel?.text = menuItems.items[section][row]
        
        //code to color the cell
        let rowCount = CGFloat(tableView.numberOfRowsInSection(indexPath.section))
        let sectionCount = CGFloat(tableView.numberOfSections)
        let currentRow = CGFloat(indexPath.row)//3
        let currentSection = CGFloat(indexPath.section)//4
        let hue = currentSection  / sectionCount //5
        let saturation = 1.0 - currentRow / rowCount //6
        cell.backgroundColor = UIColor(
            hue: hue,
            saturation: saturation,
            brightness: 1.0,
            alpha: 1.0)
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menuItems.sections[section]
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        let section = indexPath.section
        let order =
            menuItems.items[section][row] + " " +
            menuItems.sections[section]
        navigationItem.title = order
        
        //deselect the row
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //call the delegate
        myOrder.menuItem = order
        delegate.didSelectMenuItem(self, order: myOrder)
    }

}

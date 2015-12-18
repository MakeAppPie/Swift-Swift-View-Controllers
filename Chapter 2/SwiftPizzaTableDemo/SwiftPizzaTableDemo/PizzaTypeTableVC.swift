//
//  PizzaTypeTableVC.swift
//  SwiftPizzaTableDemo
//
//  Created by Steven Lipton on 9/25/15.
//  Copyright © 2015 Steven Lipton. All rights reserved.
//

import UIKit

class PizzaTypeTableVC: UITableViewController {
    var pizza = Pizza()
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizza.pizzaPricePerInSq.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //note I did not check for nil values. Something has to be really broken for these to be nil.
        let row = indexPath.row   //get the array index from the index path
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "cell",
            forIndexPath: indexPath) //make the cell
        let rowData = pizza.typeList[row]  //the dictionary key
        cell.textLabel!.text = rowData
        let myRowData = pizza.pizzaPricePerInSq[rowData]  //the dictionary value
        cell.detailTextLabel!.text = String(format: "%6.3f",myRowData!)
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

//
//  PizzaDemoVC.swift
//  SwiftPizzaTableDemo
//
//  Created by Steven Lipton on 9/25/15.
//  Copyright © 2015 Steven Lipton. All rights reserved.
//

import UIKit

class PizzaDemoVC: UIViewController{
    
    var pizza=Pizza()
    let clearString = "I Like Pizza!";
    @IBOutlet var priceLabel : UILabel!   //added 07/01/14
    @IBOutlet var resultsDisplayLabel : UILabel!
    @IBOutlet var pizzaType: UISegmentedControl!
    @IBAction func pizzaType(sender : UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        pizza.pizzaType = sender.titleForSegmentAtIndex(index)!
        displayPizza()
    }
    @IBAction func clearDisplayButton(sender : UIButton) {
        resultsDisplayLabel.text = clearString
        pizza.diameter = 0
        displayPizza()
    }
    @IBAction func sizeSegment(sender : UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        let aString = sender.titleForSegmentAtIndex(index)!
        switch aString {
        case "Personal":
            pizza.diameter = 8.0
        case "Small":
            pizza.diameter = 10.0
        case "Medium":
            pizza.diameter = 16.0
        case "Large":
            pizza.diameter = 18.0
        default:
            pizza.diameter = 0.0
        }
        displayPizza()
    }
    
    func displayPizza(){
        let displayString = String(
            format:"%6.1fin %@ Pizza",
            pizza.diameter,
            pizza.pizzaType)
        let priceString = String(
            format:"%6.2f sq in at $%6.2f is $%6.2f",
            pizza.pizzaArea(),
            pizza.unitPrice(),
            pizza.pizzaPrice())
        resultsDisplayLabel.text = displayString
        priceLabel.text = priceString
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsDisplayLabel.text = clearString
        pizza.diameter = 8.0
        pizza.pizzaType = "Cheese"
        displayPizza()
        view.backgroundColor = UIColor(red:0.99,green:0.9,blue:0.9,alpha:1.0)
    }
}



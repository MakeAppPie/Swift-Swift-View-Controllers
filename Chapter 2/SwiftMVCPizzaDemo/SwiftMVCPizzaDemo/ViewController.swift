//
// ViewController.swift
// SwiftMVCPizzaDemo
// Revised 12/15/15 Swift 2.1
// Created by Steven Lipton on 9/23/14.
// Copyright (c) 2014 MakeAppPie.Com. All rights reserved.
//

import UIKit

protocol PizzaDelegate{
func displayPizza()
}
class Pizza {
    //MARK: Properties
    var delegate:PizzaDelegate? = nil
    let pi = 3.1415926
    var pizzaDiameter:Double = 0.0{
        didSet{
            delegate?.displayPizza()
        }
    }
    let maxPizza = 24.0
    var pizzaType:String = "Cheese"{
        didSet{
            delegate?.displayPizza()
        }
    }
    var pizzaPricePerInSq:[String:Double] = [
        "Cheese": 0.03 ,
        "Sausage": 0.06 ,
        "Pepperoni": 0.05 ,
        "Veggie": 0.04
        ]{
        didSet{
            delegate?.displayPizza()
        }
    }
    //MARK: Computed Properties
    var radius : Double { //1 -- computed property
        get{  //must define a getter for a computed property
            return pizzaDiameter/2.0
        }
        set(newRadius){ //-- optionally define a setter
            pizzaDiameter = newRadius * 2.0
            delegate?.displayPizza()
        }
    }
    
    var area : Double {//10 -- computed property
        get{
            return radius * radius * pi
        }
    }
    
    //MARK: Instance Methods
    
    func unitPrice() ->Double{
        let unitPrice = pizzaPricePerInSq[pizzaType]  //2
        if (unitPrice != nil ){             //3
            return unitPrice!
        }
        else {
            return 0.0
        }
    }
    
    func pizzaPrice() ->Double{
        return area * unitPrice()
    }
    
    func diameterFromString(aString:String) -> Double {
        switch aString {
        case "Personal","8\"":
            return 8.0
        case "10\"","Small":
            return 10.0
        case "12\"":
            return 12.0
        case "16\"","Medium":
            return 16.0
        case "18\"","Large":
            return 18.0
        case "24\"","Jumbo":
            return 24.0
        default:
            return 0.0
        }
    }
}

class ViewController: UIViewController, PriceDelegate, PizzaDelegate {
    //MARK: - Outlets and properties
    var pizza = Pizza() {
        // -- instantiate a Pizza object
        didSet{
            //any Change to the class
            displayPizza()
        }
    }// Simple string to clear display
    let clearString = "I Like Pizza!"
    @IBOutlet var resultsDisplayLabel : UILabel!
    //MARK: -Actions
    @IBAction func pizzaType(sender : UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        pizza.pizzaType = sender.titleForSegmentAtIndex(index)!
        //displayPizza()
    }
    @IBAction func sizeButton(sender : UIButton) {
        //blue button
        pizza.pizzaDiameter = pizza.diameterFromString(sender.titleLabel!.text!)//2
        // displayPizza()
    }
    @IBAction func clearDisplayButton(sender : UIButton) { //red button
        resultsDisplayLabel.text = clearString
    }
    //MARK: - Instance Methods
    func displayPizza(){
        let displayString = String(
            format:"%6.1f inch %@ $%6.2f",
            pizza.pizzaDiameter,
            pizza.pizzaType,pizza.pizzaPrice())//2
        resultsDisplayLabel.text = displayString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pizza.delegate = self
        resultsDisplayLabel.text = clearString
        view.backgroundColor = UIColor(red:0.99,green:0.9,blue:0.9,alpha:1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "type price"{
            let vc = segue.destinationViewController as! PriceVC
            vc.pizza = pizza
            vc.delegate = self
        }
    }
    //MARK: - Delegates
    func priceDidFinish(
        controller: PriceVC, pizza: Pizza) {
            self.pizza = pizza //2
            controller.navigationController?.popViewControllerAnimated(true) //3
            //displayPizza()
    }
    
    
}
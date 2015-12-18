//
//  PriceVC.swift
//  SwiftMVCPizzaDemo
//
//  Created by Steven Lipton on 11/26/15.
//  Copyright © 2015 MakeAppPie.Com. All rights reserved.
//

import UIKit

protocol PriceDelegate{
    func priceDidFinish(controller:PriceVC,pizza:Pizza)
}


class PriceVC: UIViewController,PizzaDelegate {
var pizza = Pizza()
    
    var delegate:PriceDelegate? = nil
    @IBOutlet weak var unitPriceText: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var sizeToppingLabel: UILabel!
   
    @IBAction func doneEditingPrice(sender: UIBarButtonItem) {
        //navigationController?.popViewControllerAnimated(true)
        delegate?.priceDidFinish(self, pizza: pizza)
    }
    
    @IBAction func unitPriceText(sender: UITextField) {
        let unitPriceFieldText = sender.text
        let unitPrice = Double(unitPriceFieldText!)
        pizza.pizzaPricePerInSq[pizza.pizzaType] =
        unitPrice  //4
        displayPizza()

    }
    
    func displayPizza(){
        sizeToppingLabel.text = String(
            format: "%6.2f inch %@",
            pizza.pizzaDiameter,
            pizza.pizzaType
        )
        priceLabel.text = String(
            format: "%6.2f sq in $%6.3f/sq in = $%6.2f",
            pizza.area, pizza.unitPrice(),
            pizza.pizzaPrice()
        )
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let currentUnitPrice =
            pizza.pizzaPricePerInSq[pizza.pizzaType]{
                unitPriceText.text = String(
                    format: "%0.2f", currentUnitPrice)
        }
        pizza.delegate = self
        displayPizza()
        unitPriceText.keyboardType = .DecimalPad
        unitPriceText.becomeFirstResponder()


    }
    
    override func prepareForSegue(
        segue: UIStoryboardSegue,
        sender: AnyObject?) {
            if segue.identifier == "type price"{
                let vc = segue.destinationViewController
                    as! PriceVC
                vc.pizza = self.pizza
            }
    }

}

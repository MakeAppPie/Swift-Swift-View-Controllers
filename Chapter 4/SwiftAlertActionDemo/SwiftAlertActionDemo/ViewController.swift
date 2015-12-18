//
//  ViewController.swift
//  SwiftAlertActionDemo
//
//  Created by Steven Lipton on 2/26/15.
//  Copyright (c) 2015 MakeAppPie.Com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var myLabel: UILabel!
    //MARK: - Actions
    
    @IBAction func helloPizza(sender: UIButton) {
        // Alert version of this
//        let alert = UIAlertController(title: "Hello Pizza",
//            message: "Pizza Rules the World!",
//            preferredStyle: .Alert)
        // Action sheet version of this
        let alert = UIAlertController(title: "Hello Pizza",
            message: "Pizza Rules the World!",
            preferredStyle:.ActionSheet)
        let okayAction = UIAlertAction(title: "Okay",
            style: .Default,
            handler: nil)
        alert.addAction(okayAction)
        let pizzaAction = UIAlertAction(title: "Cancel",
            style: .Default,
            handler: {(action) -> Void in
                self.myLabel.text = "Hello, Pizza!!"
            }
        )
        alert.addAction(pizzaAction)
        
        //Popover configuration
        // -- mandatory for regular width devices
        // Suggest using this for any project.
        alert.modalPresentationStyle = .Popover
        presentViewController(alert, animated: true, completion: nil)
        alert.popoverPresentationController?.sourceView = view
        alert.popoverPresentationController?.sourceRect = sender.frame
        
        //Use for compact width devices only.
        //Since iPhone 6 plus can be a regular width device,
        //It is probably best to use above in all cases
        //presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func pizzaTopping(sender: UIButton) {
        var inputTextField: UITextField?
        let alert = UIAlertController(title: "Pizza Topping",
            message: "What pizza topping?",
            preferredStyle: .Alert)
        
        //define actions
        let okayAction = UIAlertAction(title: "Ok",
            style: .Default,
            handler: {(myAction) -> Void in
                self.myLabel.text = (inputTextField?.text)! + " Pizza"
        })
        let cancelAction = UIAlertAction(title: "Cancel",
            style: .Default,
            handler: nil)
        alert.addTextFieldWithConfigurationHandler({(textField) -> Void in
            // configure placeholder for password
            textField.textColor = UIColor.blueColor()
            textField.placeholder = "Type Pizza here"
            textField.secureTextEntry = true
            inputTextField = textField //move elsewhere
            
        })
        
        alert.addAction(okayAction)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func pieSelection(sender: UIButton) {
        let actionSheet = pieActionSheet()
        actionSheet.modalPresentationStyle = .Popover
        presentViewController(actionSheet,
            animated: true, completion: nil)
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = sender.frame
        //actionSheet.popoverPresentationController?.permittedArrowDirections = .Up
    }
    
    //MARK: - Instance Methods
    func displayLabel(newText:String){
        self.myLabel.text = newText
    }
    //make the action sheet for the pies, including a nested
    //alert
    func pieActionSheet() -> UIAlertController{
        let alert = UIAlertController(
            title: "Choose A Pie",
            message: "Please choose a pie",
            preferredStyle: .ActionSheet
            // above may also be UIAlertControllerStyle.ActionSheet
        )
        //Actions for Action Sheet
        let applePieAction = UIAlertAction(
            title: "Apple Pie",
            style: .Default,
            handler:{ (myAction) -> Void in
                self.displayLabel(myAction.title!)
            }
        )
        let pumpkinPieAction = UIAlertAction(
            title: "Pumpkin Pie",
            style: .Default,
            handler: {(myAction) -> Void in
                self.displayLabel(myAction.title!)
            }
        )
        
        let banoffeePieAction = UIAlertAction(
            title: "Banoffee Pie",
            style: .Default,
            handler: { (myAction) -> Void in
                self.displayLabel(myAction.title!)
            }
        )
        
        let frenchSilkPieAction = UIAlertAction(
            title: "French Silk Pie",
            style: .Default,
            handler: { (myAction) -> Void in
                self.displayLabel(myAction.title!)
            }
        )
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .Cancel,
            handler: nil
        )
        
        //Destructive Action where we nest an alert
        let noPie = UIAlertAction(
            title: "No Pie",
            style:.Destructive,
            handler: {(myAction) -> Void in
                let warningAlert = UIAlertController(
                    title: "No Pie?",
                    message: "This cannot be undone",
                    preferredStyle: .Alert
                )
                let yesAction = UIAlertAction(
                    title: "Yes",
                    style: .Destructive,
                    handler: {(myAction) -> Void in
                        self.myLabel.text = "No Pie Ordered"
                    }
                )
                let noAction = UIAlertAction(
                    title: "No", style: .Cancel,
                    handler: nil
                )
                warningAlert.addAction(yesAction)
                warningAlert.addAction(noAction)
                self.presentViewController(warningAlert,
                    animated: true,
                    completion: nil)
        })
        //add the actions to the action sheet
        alert.addAction(noPie)
        alert.addAction(applePieAction)
        alert.addAction(pumpkinPieAction)
        alert.addAction(banoffeePieAction)
        alert.addAction(frenchSilkPieAction)
        alert.addAction(cancelAction)
        return alert 
    }
}
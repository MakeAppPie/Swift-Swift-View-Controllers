//
//  ViewController.swift
//  SwiftProgNavControllerDemo
//
//  Created by Steven Lipton on 1/25/15 
//  Revised 12/15/15 Swift 2.1
//  Copyright (c) 2015 MakeAppPie.Com. 
//  All rights reserved.
//

import UIKit

class ViewController: UIViewController, TwoVCDelegate {
    //MARK: Properties
    var vcCount:Int = 0{
        didSet{
            navigationItem.title =
            "Count: \(vcCount)"
        }
    }
    
    //MARK: Outlets
    @IBOutlet weak var fourFiveSwitch: UISwitch!
    @IBOutlet weak var fourButton: UIButton!
    
    //MARK: -  Delegates
    func didFinishTwoVC(controller: TwoViewController) {
        //print("Two View controller counts \(controller.vcCount)")
        //controller.navigationController?.popViewControllerAnimated(true)
    }
    
    //MARK: - Actions
    @IBAction func fourButton(sender: UIButton) {
        if fourFiveSwitch.on{
            performSegueWithIdentifier("five", sender: self)
        }else{
            performSegueWithIdentifier("four", sender: self)
        }

    }

    @IBAction func fourFiveSwitch(sender: UISwitch) {
        if fourFiveSwitch.on{
            fourButton.setTitle("Five", forState: .Normal)
        }else{
            fourButton.setTitle("Four", forState: .Normal)
        }
    }
    @IBAction func nextButton(sender: UIButton) {
        let vc = TwoViewController(nibName: "TwoViewController", bundle: nil) //1
        vc.vcCount = ++vcCount
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true) //2
        
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationItem.title = "one"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fourFiveSwitch.on = false
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navigationItem.title = nil
        if segue.identifier == "four"{
            let vc = segue.destinationViewController
                as! FourViewController
            vc.navigationItem.title =
                "View Controller Four"
            navigationItem.title = "Four to One"
        }
        if segue.identifier == "five"{
            let vc = segue.destinationViewController
                as! FourViewController
            vc.navigationItem.title =
                "Mega Pizza Cool View Controller Five"
            navigationItem.title = "Five to One"
        }
    }
    
}
//
//  MyModalVC.swift
//  SwiftXibModalDemo
//
//  Created by Steven Lipton on 12/9/15.
//  Copyright © 2015 MakeAppPie.Com. All rights reserved.
//
import UIKit
protocol MyModalDelegate{
    func myModalDidFinish(
        controller:MyModalVC,
        pie:String)
}
class MyModalVC: UIViewController {
    var pieString = "No Pie"
    var delegate:MyModalDelegate! = nil
    @IBOutlet weak var pieLabel: UILabel!
    
    @IBAction func pieSelectionButton(
        sender: UIButton)
    {
        pieString = sender.titleLabel!.text!//7
        pieLabel.text = pieString + " Pie"//8
    }
    
    @IBAction func submitResult(sender: UIButton) {
//        dismissViewControllerAnimated(
//            true,
//            completion: nil)//12
        delegate.myModalDidFinish(self, pie: pieString)
    }
}
//
//  ViewController.swift
//  SwiftXibModalDemo
//
//  Created by Steven Lipton on 12/9/15.
//  Copyright © 2015 MakeAppPie.Com. All rights reserved.
//

import UIKit

class ViewController: UIViewController,MyModalDelegate {
    
    //MARK: Properties and outlets
    
    let pieVC = MyModalVC(
        nibName: "MyModalVC",
        bundle: nil)

    @IBOutlet weak var statusLabel: UILabel!
    
    //MARK: - Actions
    @IBAction func myModalButton(sender: UIButton) {
        pieVC.modalTransitionStyle = .PartialCurl//2
        pieVC.delegate = self
        presentViewController(pieVC, //3
            animated: true,
            completion: nil
        )
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    //MARK: - Delegates
    func myModalDidFinish(controller: MyModalVC, pie: String) {
        statusLabel.text = "Order " + pie + " pie"
        controller.dismissViewControllerAnimated(true,
        completion: nil)
    }
    
}




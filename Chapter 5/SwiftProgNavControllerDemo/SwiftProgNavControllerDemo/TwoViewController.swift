//
//  TwoViewController.swift
//  SwiftProgNavControllerDemo
//
//  Created by Steven Lipton on 1/25/15.
//  Revised 12/15/15 Swift 2.1
//  Copyright (c) 2015 MakeAppPie.Com. All rights reserved.
//

import UIKit
protocol TwoVCDelegate{
    func didFinishTwoVC(controller: TwoViewController)
}

class TwoViewController: UIViewController {
    var vcCount:Int = 0
    var delegate:TwoVCDelegate! = nil
    var didPopController = false
    
    @IBAction func nextButton(sender: UIButton) {
        let vc = ThreeViewController(nibName:"ThreeViewController", bundle:nil)
        navigationController?.pushViewController(vc, animated: true)
        didPopController = false
    }
    
    @IBAction func backButton(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
//        delegate.didFinishTwoVC(self)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        didPopController = true
    }
    override func viewWillDisappear(animated: Bool) {
//        if didPopController{
//            delegate.didFinishTwoVC(self)
//        }
    }
        override func viewDidLoad() {
        super.viewDidLoad()
        print("Visited \(vcCount) Times. ")
//        navigationItem.title = "Count: \(vcCount)"
        
    }
    
    
}
//
//  AppDelegate.swift
//  SwiftTabProgDemo
//
//  Created by Steven Lipton on 12/15/15.
//  Copyright © 2015 MakeAppPie.Com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let tabBarController = UITabBarController()//1
        //how to set up a view for a xib
        let myVC1 = PieViewController(nibName: "PieViewController", bundle: nil)//2
        
        //how to set up in storyboard with StoryboardID
        let sb = window?.rootViewController?.storyboard//3
        let myVC2 = sb?.instantiateViewControllerWithIdentifier("PizzaViewController") as! PizzaViewController //4
        
        //lines above must be here
        //before assigning root controller.
        window?.rootViewController = tabBarController//5
        
        //Add the controllers to the tab bar
        let controllers = [myVC1,myVC2]//6
        tabBarController.viewControllers = controllers//7
        //Configure tab bar items
        
        myVC1.tabBarItem = UITabBarItem(title: "Pie", image: UIImage(named: "pie bar icon"), tag: 0)
        myVC2.tabBarItem = UITabBarItem(title: "Pizza", image: UIImage(named: "pizza bar icon"),tag:1)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


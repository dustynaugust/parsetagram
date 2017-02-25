//
//  AppDelegate.swift
//  parsetagram
//
//  Created by Dustyn August on 3/1/16.
//  Copyright © 2016 Dustyn August. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "userDidLogout", name: userDidLogoutNotification, object: nil)

        
        
        Parse.initialize(
            with: ParseClientConfiguration(block: { (configuration:ParseMutableClientConfiguration) -> Void in
                configuration.applicationId = "parsetagram"
                configuration.clientKey = "dhw8jcw23sdv67yf75ety"
                configuration.server = "https://parsetagram.herokuapp.com/parse"
            })
        )
        
        let currentUser = PFUser.current()
        // check if user is logged in.
        if currentUser != nil {
            print("Current user detected")
            let viewController = storyboard.instantiateViewController(withIdentifier: "TabBarController")
            window?.rootViewController = viewController
            window?.makeKeyAndVisible()
        } else {
            print("no user found")
            let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            // Make the vc the root view controller
            window?.rootViewController = viewController
            window?.makeKeyAndVisible()
        }

        
        return true
    }
    
    
//    func userDidLogout() {
//        let vc = storyboard.instantiateInitialViewController()! as UIViewController
//        window?.rootViewController = vc
//    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


//
//  AppDelegate.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 3/13/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var centerContainer: MMDrawerController?
    
    var viewIdentifier: String?
    var viewController: UIViewController?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn")
        
        if isUserLoggedIn {
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let centerViewController = mainStoryboard.instantiateViewControllerWithIdentifier("PlacesView") as! PlacesView
            let leftMenuViewController = mainStoryboard.instantiateViewControllerWithIdentifier("Menu") as! Menu
            
            let leftSideNav = UINavigationController(rootViewController: leftMenuViewController)
            let centerNav = UINavigationController(rootViewController: centerViewController)
            
            centerContainer = MMDrawerController(centerViewController: centerNav, leftDrawerViewController: leftSideNav)
            
            centerContainer?.shadowRadius = 3.0
            centerContainer?.setMaximumLeftDrawerWidth((window?.bounds.width)! - 55.0, animated: true, completion: nil)
            
            centerContainer!.openDrawerGestureModeMask = MMOpenDrawerGestureMode.PanningCenterView;
            centerContainer!.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.PanningCenterView;
            
            window!.rootViewController = centerContainer
            window!.makeKeyAndVisible()
            
        }
        
        return true
    }
    
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        
        switch shortcutItem.type {
        case "history":
            viewIdentifier = "History"
            viewController = History()
        case "rules":
            viewIdentifier = "Rules"
            viewController = Rules()
        default:
            viewIdentifier = "PlacesView"
            viewController = PlacesView()
        }
    }
    
}


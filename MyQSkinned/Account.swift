//
//  Account.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 4/9/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class Account: UIViewController {
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    //TO DELETE
    private let addNewDevice = AddNewDevice()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //TO DELETE
        view.addSubview(addNewDevice)
        addNewDevice.addTarget(self, action: #selector(addTapped(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        NSLayoutConstraint.activateConstraints([
            addNewDevice.widthAnchor.constraintEqualToAnchor(view.widthAnchor, multiplier: 0.7),
            addNewDevice.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor),
            addNewDevice.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor),
            
        ])
    }
    
    //TO DELETE
    func addTapped(sender: UIControl) {
        
        print("Tapped")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // self.navigationController?.navigationBarHidden = true
        
        // Set Nav Bar Invisible
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        let screenWidth = screenSize.width
        
        //Navigation bar customization
        if screenWidth == 320 {
            self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : (UIFont(name: "TitilliumWeb-Regular", size: 18))!]
            // Nav Bar Button Item custom font
            self.navigationItem.rightBarButtonItem!.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "TitilliumWeb-Light", size: 16)!], forState: .Normal)
        } else {
            self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : (UIFont(name: "TitilliumWeb-Regular", size: 22))!]
            // Nav Bar Button Item custom font
            self.navigationItem.rightBarButtonItem!.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "TitilliumWeb-Light", size: 20)!], forState: .Normal)
        }
        
        

    }
    
    @IBAction func menuButton(sender: UIBarButtonItem) {
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }
    
    @IBAction func logoutTapped(sender: UIBarButtonItem) {
        
        // Sets flag to FALSE for system to remember that user is logged in and iOS saves state
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        let launchViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Launch") as! Launch
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = launchViewController
        
    }
    
    func logout() {
        
        // Sets flag to FALSE for system to remember that user is logged in and iOS saves state
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        let launchViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Launch") as! Launch
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = launchViewController
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

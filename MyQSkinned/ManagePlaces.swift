//
//  ManagePlaces.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 4/9/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class ManagePlaces: UIViewController {
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // self.navigationController?.navigationBarHidden = true
        
        
        
        // Set Nav Bar Invisible
        // navigationController.navigationBar.setBackgroundImage(image, forBarMetrics: .Default)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "nav-bar-bkgd"), forBarMetrics: UIBarMetrics.Default)
        // self.navigationController?.navigationBar.shadowImage = UIImage()
        // self.navigationController?.navigationBar.translucent = true
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        let screenWidth = screenSize.width
        
        //Navigation bar customization
        if screenWidth == 320 {
            self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : (UIFont(name: "TitilliumWeb-Regular", size: 18))!]
        } else {
            self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : (UIFont(name: "TitilliumWeb-Regular", size: 22))!]
        }
    }
    
    @IBAction func menuButton(sender: UIBarButtonItem) {
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
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

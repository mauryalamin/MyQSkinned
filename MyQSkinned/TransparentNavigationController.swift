//
//  TransparentNavigationController.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 4/6/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class TransparentNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Set Nav Bar Invisible
        self.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.translucent = true
        
        self.navigationBar.barStyle = UIBarStyle.Black
        self.navigationBar.tintColor = UIColor.whiteColor()
        
        //Navigation bar customization
        self.navigationBar.titleTextAttributes = [NSFontAttributeName : (UIFont(name: "TitilliumWeb-Regular", size: 18))!]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

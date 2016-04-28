//
//  VerifyAccount.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 3/26/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class VerifyAccount: UIViewController {

    @IBOutlet weak var okButton: UIBarButtonItem!
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        okButton.setTitleTextAttributes([ NSFontAttributeName: UIFont(name: "TitilliumWeb-Light", size: 16)!], forState: UIControlState.Normal)
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationItem.hidesBackButton = true
        
        let screenWidth = screenSize.width
        
        //Navigation bar customization
        if screenWidth == 320 {
            // self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : (UIFont(name: "TitilliumWeb-Regular", size: 18))!]
            // Nav Bar Button Item custom font
            self.navigationItem.rightBarButtonItem!.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "TitilliumWeb-Light", size: 16)!], forState: .Normal)
        } else {
            // self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : (UIFont(name: "TitilliumWeb-Regular", size: 22))!]
            // Nav Bar Button Item custom font
            self.navigationItem.rightBarButtonItem!.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "TitilliumWeb-Light", size: 18)!], forState: .Normal)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissView(sender: UIBarButtonItem) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
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

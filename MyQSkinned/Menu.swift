//
//  Menu.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 3/13/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class Menu: UIViewController {
    
    @IBOutlet weak var placesButton: MenuItem!
    @IBOutlet weak var manageButton: MenuItem!
    @IBOutlet weak var accountButton: MenuItem!
    @IBOutlet weak var rulesButton: MenuItem!
    @IBOutlet weak var historyButton: MenuItem!
    @IBOutlet weak var helpButton: MenuItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        placesButton.buttonSelected()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
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
    
    @IBAction func buttonTouched(sender: MenuItem) {
        
        placesButton.buttonUnselected()
        manageButton.buttonUnselected()
        accountButton.buttonUnselected()
        rulesButton.buttonUnselected()
        historyButton.buttonUnselected()
        helpButton.buttonUnselected()
        
        sender.buttonSelected()
        // print("\(sender.label.text!)")
        
        switch (sender.label.text!) {
        case "Places":
            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PlacesView") as! PlacesView
            let centerNavController = UINavigationController(rootViewController: centerViewController)
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.centerContainer!.centerViewController = centerNavController
            appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
            break
        case "Manage Places":
            let managePlacesView = self.storyboard?.instantiateViewControllerWithIdentifier("ManagePlacesTableViewController") as! ManagePlacesTableViewController
            let manageNavController = UINavigationController(rootViewController: managePlacesView)
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.centerContainer!.centerViewController = manageNavController
            appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
            break
        case "Account":
            let accountView = self.storyboard?.instantiateViewControllerWithIdentifier("Account") as! Account
            let accountNavController = UINavigationController(rootViewController: accountView)
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.centerContainer!.centerViewController = accountNavController
            appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
            break
        case "Rules":
            let rulesView = self.storyboard?.instantiateViewControllerWithIdentifier("Rules") as! Rules
            let rulesNavController = UINavigationController(rootViewController: rulesView)
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.centerContainer!.centerViewController = rulesNavController
            appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
            break
        case "History":
            let historyView = self.storyboard?.instantiateViewControllerWithIdentifier("History") as! History
            let historyNavController = UINavigationController(rootViewController: historyView)
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.centerContainer!.centerViewController = historyNavController
            appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
            break
        case "Help":
            let helpView = self.storyboard?.instantiateViewControllerWithIdentifier("Help") as! Help
            let helpNavController = UINavigationController(rootViewController: helpView)
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.centerContainer!.centerViewController = helpNavController
            appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
            break
        default:
            print("Nothing was tapped")
        }
        
        
        
    }
    
}

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
        print("\(sender.label.text!)")
        
    }
    
}

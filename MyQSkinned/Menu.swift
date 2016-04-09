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
    
    var interactor:Interactor? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
    
    @IBAction func handleGesture(sender: UIPanGestureRecognizer) {
        // 3
        let translation = sender.translationInView(view)
        // 4
        let progress = MenuHelper.calculateProgress(
            translation,
            viewBounds: view.bounds,
            direction: .Left
        )
        // 5
        MenuHelper.mapGestureStateToInteractor(
            sender.state,
            progress: progress,
            interactor: interactor){
                // 6
                self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func closeMenu(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }


}

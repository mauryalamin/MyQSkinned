//
//  Launch.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 3/13/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class Launch: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet weak var brandLogo: UIImageView!
    @IBOutlet weak var myqLogo: UIImageView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var emailRule: UIView!
    @IBOutlet weak var passwordRule: UIView!
    @IBOutlet weak var rememberCheck: UIImageView!
    @IBOutlet weak var forgotButton: UIButton!
    @IBOutlet weak var rememberButton: UIButton!
    @IBOutlet weak var wallpaperImage: UIImageView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var learnMoreButton: UIButton!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    // Properties
    var textFields: [UITextField]!
    var check: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        hideKeyboardWhenTappedAround()
        
        textFields = [email, password]
        
        for field in textFields {
            
            field.delegate = self
            
        }
        
        addParallaxToView(brandLogo)
        addParallaxToView(myqLogo)
        addParallaxToView(email)
        addParallaxToView(password)
        addParallaxToView(emailRule)
        addParallaxToView(signUpButton)
        addParallaxToView(learnMoreButton)
        addParallaxToView(copyrightLabel)
        addParallaxToView(passwordRule)
        addParallaxToView(forgotButton)
        addParallaxToView(rememberButton)
        addParallaxToView(rememberCheck)
        
        checkBox (check)
    }
    
    func checkBox (isChecked: Bool) {
        if !isChecked {
            rememberCheck.highlighted = false
        } else {
            rememberCheck.highlighted = true
        }
    }
    
    // MARK: - Textfield Methods
    
    // Iterate through textFields
    // http://www.raywenderlich.com/92894/video-tutorial-ios-101-swift-part-2-common-uikit-controls
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let textFieldArray = textFields as NSArray
        let i = textFieldArray.indexOfObject(textField)
        if i < textFieldArray.count - 1 {
            let newTextField = textFieldArray[i + 1] as! UITextField
            newTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
        
    }
    
    // MARK: - Parallax Effect
    
    // https://www.hackingwithswift.com/example-code/uikit/how-to-create-a-parallax-effect-in-uikit
    func addParallaxToView(vw: UIView) {
        let amount = 15
        
        let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = -amount
        horizontal.maximumRelativeValue = amount
        
        let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
        vertical.minimumRelativeValue = -amount
        vertical.maximumRelativeValue = amount
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontal, vertical]
        vw.addMotionEffect(group)
    }
    
    // MARK: - Button Methods
    
    // Button Actions
    @IBAction func loginTapped(sender: UIButton) {
        
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // var rootViewController = appDelegate.window!.rootViewController
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let centerViewController = mainStoryboard.instantiateViewControllerWithIdentifier("PlacesView") as! PlacesView
        let leftMenuViewController = mainStoryboard.instantiateViewControllerWithIdentifier("Menu") as! Menu
        
        let leftSideNav = UINavigationController(rootViewController: leftMenuViewController)
        let centerNav = UINavigationController(rootViewController: centerViewController)
        
        let centerContainer = MMDrawerController(centerViewController: centerNav, leftDrawerViewController: leftSideNav)
        
        centerContainer?.shadowRadius = 3.0
        centerContainer?.setMaximumLeftDrawerWidth((appDelegate.window?.bounds.width)! - 55.0, animated: true, completion: nil)
        
        centerContainer!.openDrawerGestureModeMask = MMOpenDrawerGestureMode.PanningCenterView;
        centerContainer!.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.PanningCenterView;
        
        // Sets flag to TRUE for system to remember that user is logged in and iOS saves state
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        appDelegate.centerContainer = centerContainer
        
        appDelegate.window!.rootViewController = centerContainer
        appDelegate.window!.makeKeyAndVisible()
        
        
    }
    
    
    @IBAction func buttonTapped(sender: UIButton) {
        
        switch (sender.titleLabel!.text!) {
            
        case "Remember Me":
            if check {
                check = false
            } else {
                check = true
            }
            checkBox (check)
        default:
            print("Tapped")
        }
        
        
    }
    
    // MARK: - System Methods
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
        
}

// http://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}




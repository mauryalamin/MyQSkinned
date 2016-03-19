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
        
        textFields = [email, password]
        email.delegate = self
        password.delegate = self
        
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
    
    // Touch anywhere to dismiss keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
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
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

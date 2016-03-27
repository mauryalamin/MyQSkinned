//
//  CreateAccount.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 3/26/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class CreateAccount: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    // Textfields
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var acctEmail: UITextField!
    @IBOutlet weak var createPassword: UITextField!
    @IBOutlet weak var verifyPassword: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    
    // Checkboxes
    @IBOutlet weak var getInfoCheck: UIButton!
    @IBOutlet weak var acctLinkCheck: UIButton!
    @IBOutlet weak var agreeCheck: UIButton!
    
    var textFields: [UITextField]!
    
    var getInfo = true
    var acctLink = false
    var agree = false
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        hideKeyboardWhenTappedAround()
        
        textFields = [firstName, lastName, acctEmail, createPassword, verifyPassword, zipCode]
        
        for field in textFields {
            
            field.delegate = self
            
        }
        
        getInfoCheck.selected = true
        acctLinkCheck.selected = false
        agreeCheck.selected = false
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CreateAccount.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CreateAccount.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkBox(sender: UIButton) {
        
        let selectedState = sender.selected
        
        sender.selected = !selectedState
        
    }
    
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
    
    // MARK: - Set Keyboard Insets
    
    //https://www.raywenderlich.com/93378/video-tutorial-swift-scroll-view-school-part-9-keyboard-insets
    
    deinit {
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        adjustForKeyboardShow(true, notification: notification)
        
        print("Fired off keyboardWillShow")
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        adjustForKeyboardShow(false, notification: notification)
        
        print("Fired off keyboardWillHide")
        
    }
    
    func adjustForKeyboardShow(show: Bool, notification: NSNotification) {
        
        let userInfo = notification.userInfo ?? [:]
        let keyboardFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        
        let adjustmentHeight = (CGRectGetHeight(keyboardFrame) + 30) * (show ? 1 : -1)
        
        scrollView.contentInset.bottom += adjustmentHeight
        scrollView.scrollIndicatorInsets.bottom += adjustmentHeight
        
    }
    
    
}





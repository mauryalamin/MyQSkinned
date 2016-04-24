//
//  MenuItem.swift
//  CustomMenuButtons
//
//  Created by Maury Alamin on 3/11/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit
@IBDesignable

class MenuItem: UIControl {
    
    // Create icon placeholder
    private let menuIcon = UIImageView.configuredImageView()
    
    // Create and configure text label
    var label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "TitilliumWeb-Light", size: 19)
        return label
    }()
    
    // Create empty UIView with color to illustrate selectedButton
    private let selectedView = UIView()
    
    // Define colors
    let defaultColor = UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1)
    let selectedColor = UIColor.blackColor()
    var brand: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        #if !TARGET_INTERFACE_BUILDER
            translatesAutoresizingMaskIntoConstraints = false
        #endif
        
        prepareView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareView()
    }
    
    private func prepareView() {
        
        let spacing: CGFloat = 18
        
        // Set label color
        label.textColor = defaultColor
        
        // Configure selectedButton shape
        selectedView.translatesAutoresizingMaskIntoConstraints = false
        selectedView.backgroundColor = UIColor(red: 95/255, green: 160/255, blue: 207/255, alpha: 0.5)
        selectedView.hidden = true;
        
        // Add views
        addSubview(selectedView)
        addSubview(label)
        addSubview(menuIcon)
        
        // Arrange and constrain view placement
        NSLayoutConstraint.activateConstraints([
            heightAnchor.constraintEqualToConstant(40),
            selectedView.heightAnchor.constraintEqualToAnchor(heightAnchor),
            selectedView.leadingAnchor.constraintEqualToAnchor(leadingAnchor, constant: 10),
            selectedView.trailingAnchor.constraintEqualToAnchor(trailingAnchor),
            selectedView.centerYAnchor.constraintEqualToAnchor(centerYAnchor),
            menuIcon.widthAnchor.constraintEqualToConstant(26),
            menuIcon.heightAnchor.constraintEqualToConstant(26),
            menuIcon.leadingAnchor.constraintEqualToAnchor(leadingAnchor, constant: spacing),
            menuIcon.centerYAnchor.constraintEqualToAnchor(centerYAnchor),
            label.widthAnchor.constraintEqualToConstant(200),
            label.heightAnchor.constraintEqualToConstant(22),
            label.leadingAnchor.constraintEqualToAnchor(menuIcon.trailingAnchor, constant: spacing),
            label.centerYAnchor.constraintEqualToAnchor(centerYAnchor)
            ])
    }
    
    func buttonSelected() {
        
        selectedView.hidden = false
        label.textColor = selectedColor
        menuIcon.image = menuIcon.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        menuIcon.tintColor = selectedColor
        
    }
    
    func buttonUnselected() {
        
        selectedView.hidden = true
        label.textColor = defaultColor
        menuIcon.image = menuIcon.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        menuIcon.tintColor = defaultColor
        
    }
    
}

extension MenuItem {
    @IBInspectable
    var icon: UIImage? {
        get {
            return menuIcon.image
        }
        set {
            menuIcon.image = newValue
        }
    }
    
    @IBInspectable
    var text: String? {
        get {
            return label.text
        }
        set(newText) {
            label.text = newText
        }
    }
    
}

















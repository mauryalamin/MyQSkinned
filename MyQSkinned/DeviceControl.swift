//
//  DeviceControl.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 3/30/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class DeviceControl: UIView {
    
    private let deviceImageView = UIImageView.configuredImageView(withImageNamed: "gdo-closed")
    
    
    
    // Create and configure Place Name label
    var placeNameLabel : UILabel = {
        let placeNameLabel = UILabel()
        placeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        placeNameLabel.font = UIFont(name: "TitilliumWeb-Regular", size: 17)
        placeNameLabel.textColor = UIColor.whiteColor()
        placeNameLabel.textAlignment = .Center
        return placeNameLabel
    }()
    
    // Create and configure Device Name label
    var deviceNameLabel : UILabel = {
        let deviceNameLabel = UILabel()
        deviceNameLabel.translatesAutoresizingMaskIntoConstraints = false
        deviceNameLabel.font = UIFont(name: "OpenSans-Light", size: 25)
        deviceNameLabel.textColor = UIColor.whiteColor()
        deviceNameLabel.textAlignment = .Center
        return deviceNameLabel
    }()
    
    // Create and configure Status label
    var statusLabel : UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = UIFont(name: "OpenSans", size: 13)
        statusLabel.textColor = UIColor.whiteColor()
        statusLabel.textAlignment = .Center
        return statusLabel
    }()
    
    // Create empty UIView with color to illustrate selectedButton
    private let deviceControlArea = UIView()

    // 1
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 2
        translatesAutoresizingMaskIntoConstraints = false
        // 3
        prepareView()
    }
    // 4
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareView()
    }
    // 5
    private func prepareView() {
        
        // backgroundColor = .orangeColor()
        
        // Set label color
        
        
        placeNameLabel.text = "MY HOME"
        deviceNameLabel.text = "Garage Door"
        statusLabel.text = "CLOSED FOR 2 MINUTES"
        
        deviceControlArea.backgroundColor = UIColor.blueColor()
        // deviceImageView.backgroundColor = UIColor.blueColor()
        
        // addSubview(deviceControlArea)
        addSubview(placeNameLabel)
        addSubview(deviceNameLabel)
        addSubview(deviceImageView)
        addSubview(statusLabel)
        
        let spacing: CGFloat = 4
        
        NSLayoutConstraint.activateConstraints([
            // heightAnchor.constraintEqualToAnchor(widthAnchor, multiplier: 0.8),
            
            placeNameLabel.widthAnchor.constraintEqualToAnchor(widthAnchor),
            placeNameLabel.heightAnchor.constraintEqualToConstant(22),
            placeNameLabel.centerXAnchor.constraintEqualToAnchor(centerXAnchor),
            placeNameLabel.topAnchor.constraintEqualToAnchor(topAnchor, constant: spacing),
            
            deviceNameLabel.widthAnchor.constraintEqualToAnchor(widthAnchor),
            deviceNameLabel.heightAnchor.constraintEqualToConstant(30),
            deviceNameLabel.centerXAnchor.constraintEqualToAnchor(placeNameLabel.centerXAnchor),
            deviceNameLabel.topAnchor.constraintEqualToAnchor(placeNameLabel.bottomAnchor),
            
            deviceImageView.topAnchor.constraintEqualToAnchor(deviceNameLabel.bottomAnchor),
            deviceImageView.centerXAnchor.constraintEqualToAnchor(deviceNameLabel.centerXAnchor),
            deviceImageView.widthAnchor.constraintEqualToAnchor(widthAnchor, multiplier: 0.6),
            deviceImageView.heightAnchor.constraintEqualToConstant(160),
            
            statusLabel.widthAnchor.constraintEqualToAnchor(widthAnchor, multiplier: 0.5),
            statusLabel.heightAnchor.constraintEqualToConstant(16),
            statusLabel.centerXAnchor.constraintEqualToAnchor(deviceImageView.centerXAnchor),
            statusLabel.topAnchor.constraintEqualToAnchor(deviceImageView.bottomAnchor),
            
        ])
    }

}

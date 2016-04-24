//
//  DeviceControl.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 3/30/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class DeviceControl: UIView {
    
    private let deviceImageView = UIImageView.configuredImageView()
    
    // Create and configure Place Name label
    var placeNameLabel : UILabel = {
        let placeNameLabel = UILabel()
        placeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        placeNameLabel.font = UIFont(name: "TitilliumWeb-Regular", size: 20)
        placeNameLabel.textColor = UIColor.whiteColor()
        placeNameLabel.textAlignment = .Center
        return placeNameLabel
    }()
    
    // Create and configure Device Name label
    var deviceNameLabel : UILabel = {
        let deviceNameLabel = UILabel()
        deviceNameLabel.translatesAutoresizingMaskIntoConstraints = false
        deviceNameLabel.font = UIFont(name: "OpenSans-Light", size: 29)
        deviceNameLabel.minimumScaleFactor = 0.6
        deviceNameLabel.textColor = UIColor.whiteColor()
        deviceNameLabel.textAlignment = .Center
        return deviceNameLabel
    }()
    
    // Create and configure Status label
    var statusLabel : UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = UIFont(name: "OpenSans", size: 16)
        statusLabel.minimumScaleFactor = 0.6
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
        
        addSubview(placeNameLabel)
        addSubview(deviceNameLabel)
        addSubview(deviceImageView)
        addSubview(statusLabel)
        
        let spacing: CGFloat = 16
        
        NSLayoutConstraint.activateConstraints([
            // heightAnchor.constraintEqualToAnchor(widthAnchor, multiplier: 0.8),
            
            placeNameLabel.widthAnchor.constraintEqualToAnchor(widthAnchor),
            placeNameLabel.heightAnchor.constraintEqualToConstant(24),
            placeNameLabel.centerXAnchor.constraintEqualToAnchor(centerXAnchor),
            placeNameLabel.topAnchor.constraintEqualToAnchor(topAnchor, constant: spacing),
            
            deviceNameLabel.widthAnchor.constraintEqualToAnchor(widthAnchor),
            deviceNameLabel.heightAnchor.constraintEqualToConstant(36),
            deviceNameLabel.centerXAnchor.constraintEqualToAnchor(placeNameLabel.centerXAnchor),
            deviceNameLabel.topAnchor.constraintEqualToAnchor(placeNameLabel.bottomAnchor, constant: 4),
            
            deviceImageView.topAnchor.constraintEqualToAnchor(deviceNameLabel.bottomAnchor),
            deviceImageView.centerXAnchor.constraintEqualToAnchor(deviceNameLabel.centerXAnchor),
            deviceImageView.widthAnchor.constraintEqualToAnchor(widthAnchor, multiplier: 0.6),
            deviceImageView.heightAnchor.constraintEqualToConstant(170),
            
            statusLabel.widthAnchor.constraintEqualToAnchor(widthAnchor, multiplier: 0.7),
            statusLabel.heightAnchor.constraintEqualToConstant(16),
            statusLabel.centerXAnchor.constraintEqualToAnchor(deviceImageView.centerXAnchor),
            statusLabel.topAnchor.constraintEqualToAnchor(deviceImageView.bottomAnchor),
            
        ])
    }

}

extension DeviceControl {
    
    var placeText: String? {
        get {
            return placeNameLabel.text
        }
        set(newText) {
            placeNameLabel.text = newText
        }
    }
    
    var deviceText: String? {
        get {
            return deviceNameLabel.text
        }
        set(newText) {
            deviceNameLabel.text = newText
        }
    }
    
    var deviceIconImage: UIImage? {
        get {            
            return deviceImageView.image
        }
        
        set {
            deviceImageView.image = newValue
        }        
    }
    
    var statusText: String? {
        get {
            return statusLabel.text
        }
        set(newText) {
            statusLabel.text = newText
        }
    }
    
    
    
}





















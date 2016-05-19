//
//  AddNewDevice.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 5/19/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class AddNewDevice: UIControl {
    
    private let addDevice = UIImageView.configuredImageView(withImageNamed: "addNewDevice")
    
    // Create and configure Place Name label
    var label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "OpenSans-Light", size: 26)
        label.textColor = UIColor.whiteColor()
        label.textAlignment = .Center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        prepareView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareView()
    }
    
    
    private func prepareView() {
        
        label.text = "Tap to add device"
        
        addSubview(addDevice)
        addSubview(label)
        
        // backgroundColor = UIColor.orangeColor()
        
        NSLayoutConstraint.activateConstraints([
            
            heightAnchor.constraintEqualToAnchor(widthAnchor, multiplier: 0.7),
            
            addDevice.widthAnchor.constraintEqualToAnchor(widthAnchor, multiplier: 0.6),
            addDevice.heightAnchor.constraintEqualToAnchor(addDevice.widthAnchor),
            addDevice.centerXAnchor.constraintEqualToAnchor(centerXAnchor),
            addDevice.topAnchor.constraintEqualToAnchor(topAnchor, constant: 5),
            
            label.widthAnchor.constraintEqualToAnchor(widthAnchor),
            label.heightAnchor.constraintEqualToConstant(36),
            label.centerXAnchor.constraintEqualToAnchor(addDevice.centerXAnchor),
            label.topAnchor.constraintEqualToAnchor(addDevice.bottomAnchor, constant: 16),
            
        ])
        
        
    }

}

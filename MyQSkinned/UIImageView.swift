//
//  UIImageView.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 3/13/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

extension UIImageView {
    
    class func configuredImageView(withImageNamed imageName: String?) -> UIImageView {
        let imageView = UIImageView()
        if let imageName = imageName {
            imageView.image = UIImage(named: imageName)
        }
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .ScaleAspectFill
        return imageView
    }
    
    class func configuredImageView() -> UIImageView {
        return configuredImageView(withImageNamed: nil)
    }
    
}

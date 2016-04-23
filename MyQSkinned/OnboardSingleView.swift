//
//  OnboardSingleView.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 3/27/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class OnboardSingleView: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var backgroundImage: UIImage?
    var titleString: String?
    var descriptionString: String?
    
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        backgroundImageView.image = backgroundImage
        
        if let titleString = titleString {
            let font = UIFont(name: "OpenSans-Light", size:35.0)!
            let paragraphStyle = NSMutableParagraphStyle()
            // paragraphStyle.lineSpacing = 8
            paragraphStyle.alignment = .Center
            
            titleLabel.attributedText = NSAttributedString(string: titleString,
                                                          attributes: [NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle])
        }
        
        if let descriptionString = descriptionString {
            let font = UIFont(name: "OpenSans", size:17.0)!
            let paragraphStyle = NSMutableParagraphStyle()
            // paragraphStyle.lineSpacing = 0
            paragraphStyle.alignment = .Left
            
            descriptionLabel.attributedText = NSAttributedString(string: descriptionString,
                                                           attributes: [NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle])
        }
        
    }
    
    


    

}

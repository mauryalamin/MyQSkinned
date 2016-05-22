//
//  CustomDetailCell.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 5/22/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class CustomDetailCell: UITableViewCell {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

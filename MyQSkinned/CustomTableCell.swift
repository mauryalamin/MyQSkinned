//
//  CustomTableCell.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 4/29/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class CustomTableCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!    
    @IBOutlet weak var detailDisclosure: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  TableViewCell.swift
//  CustomtableView
//
//  Created by iStudents on 2/27/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    
    @IBOutlet var customLable: UILabel!
    @IBOutlet var customImgaeView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

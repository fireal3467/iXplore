//
//  MyCell.swift
//  IXplore
//
//  Created by Alan Yu on 7/12/16.
//  Copyright © 2016 Alan-Yu. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

  
    @IBOutlet weak var imageBox: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

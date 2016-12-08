//
//  OwedTableViewCell.swift
//  SplitIt
//
//  Created by Aaron Bailey on 12/7/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class OwedTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var transAmountLabel: UILabel!
    @IBOutlet weak var transDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

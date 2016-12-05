//
//  owedTableViewCell.swift
//  SplitIt
//
//  Created by Aaron Bailey on 12/4/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class owedTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userOwedLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellBackgroundView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

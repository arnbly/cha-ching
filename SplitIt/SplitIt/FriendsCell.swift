//
//  FriendsCell.swift
//  SplitIt
//
//  Created by Lauren Tindal on 12/3/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class FriendsCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var selectDefault: UIImageView!
    @IBOutlet weak var selectActive: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  HistoryFriendsCellViewTableViewCell.swift
//  SplitIt
//
//  Created by Amrutha Krishnan on 12/8/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class HistoryFriendsCellViewTableViewCell: UITableViewCell {

    
    @IBOutlet weak var userProfilePicture: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var amount: UILabel!
    
    @IBOutlet weak var amountFor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

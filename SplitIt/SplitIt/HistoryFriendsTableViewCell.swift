//
//  HistoryFriendsTableViewCell.swift
//  SplitIt
//
//  Created by Lauren Tindal on 12/12/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class HistoryFriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var amountFor: UILabel!
    @IBOutlet weak var payAmount: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

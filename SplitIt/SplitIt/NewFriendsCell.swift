//
//  NewFriendsCell.swift
//  SplitIt
//
//  Created by Lauren Tindal on 12/6/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class NewFriendsCell: UITableViewCell {
    
    @IBOutlet weak var isChecked: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var isActuallyChecked: UIImageView!
    @IBOutlet weak var userImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}

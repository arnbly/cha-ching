//
//  NewTableViewCell.swift
//  SplitIt
//
//  Created by Lauren Tindal on 12/5/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userPayment: UITextField!
    @IBOutlet weak var userName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

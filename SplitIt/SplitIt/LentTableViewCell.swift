//
//  LentTableViewCell.swift
//  Pods
//
//  Created by Aaron Bailey on 12/7/16.
//
//

import UIKit

class LentTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var transDescriptionLabel: UILabel!
    @IBOutlet weak var transAmountLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

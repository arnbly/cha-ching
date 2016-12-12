//
//  owedSwipeTableCell.swift
//  Pods
//
//  Created by Aaron Bailey on 12/11/16.
//
//

import UIKit
import MGSwipeTableCell

class owedSwipeTableCell: MGSwipeTableCell {

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

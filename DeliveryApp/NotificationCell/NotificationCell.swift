//
//  NotificationCell.swift
//  DeliveryApp
//
//  Created by MAC PRO on 27/03/24.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var companyLogoImgVw: UIImageView!
    
    @IBOutlet weak var DoneLbl: UILabel!
    
    @IBOutlet weak var aboutLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

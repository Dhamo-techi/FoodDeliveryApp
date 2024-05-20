//
//  SettingTableCell.swift
//  DeliveryApp
//
//  Created by MAC PRO on 27/03/24.
//

import UIKit

class SettingTableCell: UITableViewCell {

    
    @IBOutlet weak var settingLogo: UIImageView!
    
    @IBOutlet weak var settingNameLbl: UILabel!
    
    @IBOutlet weak var settingBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  SidemenuCell.swift
//  DeliveryApp
//
//  Created by MAC PRO on 26/02/24.
//

import UIKit

class SidemenuCell: UITableViewCell {

    
    @IBOutlet weak var NameLBL: UILabel!
    
    @IBOutlet weak var subnameLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func NextBtnTapped(_ sender: Any) {
    }
    
    
}

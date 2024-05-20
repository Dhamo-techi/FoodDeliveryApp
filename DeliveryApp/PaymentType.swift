//
//  PaymentType.swift
//  DeliveryApp
//
//  Created by apple on 06/05/24.
//

import UIKit

class PaymentType: UITableViewCell {

    
    @IBOutlet weak var paymentLogoImgvw: UIImageView!
    
    @IBOutlet weak var paymentNameLbl: UILabel!
    
    @IBOutlet weak var selectionBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

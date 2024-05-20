//
//  AddYourAddressCell.swift
//  DeliveryApp
//
//  Created by MAC PRO on 02/04/24.
//

import UIKit

class AddYourAddressCell: UICollectionViewCell {

    @IBOutlet weak var addBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
        
        self.addBtn.layer.cornerRadius = 20.0
        self.addBtn.layer.borderWidth = 2
        self.addBtn.layer.borderColor = UIColor.lightGray.cgColor
    }

}

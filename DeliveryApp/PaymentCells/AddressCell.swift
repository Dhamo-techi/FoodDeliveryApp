//
//  AddressCell.swift
//  DeliveryApp
//
//  Created by MAC PRO on 02/04/24.
//

import UIKit

class AddressCell: UICollectionViewCell {

    
    @IBOutlet weak var selectionBtn: UIButton!
    
    @IBOutlet weak var TitleLbl: UILabel!
    
    @IBOutlet weak var MblNumberLbl: UILabel!
    
    @IBOutlet weak var addressLbl: UILabel!
    
    @IBOutlet weak var editBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
    
    }

}

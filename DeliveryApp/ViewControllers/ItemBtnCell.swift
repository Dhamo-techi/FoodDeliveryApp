//
//  ItemBtnCell.swift
//  DeliveryApp
//
//  Created by MAC PRO on 06/03/24.
//

import UIKit

class ItemBtnCell: UICollectionViewCell {


    @IBOutlet weak var itemLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layer.cornerRadius = 30
        layer.masksToBounds = true
        
        if frame.origin.x == 0 {
                    itemLbl.backgroundColor = .red
                } else {
                    itemLbl.backgroundColor = .lightGray // Default color for other cells
                }
    }
    

}

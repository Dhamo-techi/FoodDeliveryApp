//
//  ItemsCell(food,juice,etc.swift
//  DeliveryApp
//
//  Created by MAC PRO on 13/03/24.
//

import UIKit

class ItemsCell: UICollectionViewCell {

    
    @IBOutlet weak var itemImgVw: UIImageView!
    
    @IBOutlet weak var itemNameLbl: UILabel!
    
    @IBOutlet weak var itemRatingLbl: UILabel!
    
    @IBOutlet weak var itemAbtLbl: UILabel!
    
    @IBOutlet weak var itemTimingLbl: UILabel!
    
    @IBOutlet weak var itemPriceLbl: UILabel!
    
    @IBOutlet weak var ItemlikeBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layer.cornerRadius = 40.0
        layer.masksToBounds = true
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.gray.cgColor
        
        self.itemImgVw.layer.cornerRadius = 40
        self.itemPriceLbl.layer.cornerRadius = 20
        self.itemPriceLbl.layer.masksToBounds = true
        self.ItemlikeBtn.layer.cornerRadius = 25

    }

}

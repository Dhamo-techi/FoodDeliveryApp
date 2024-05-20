//
//  FoodsCell.swift
//  DeliveryApp
//
//  Created by MAC PRO on 12/03/24.
//

import UIKit

class FoodsCell: UICollectionViewCell {

    
    @IBOutlet weak var foodImgVw: UIImageView!
    
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBOutlet weak var foodNameLbl: UILabel!
    
    @IBOutlet weak var foodAbtLbl: UILabel!
    
    @IBOutlet weak var ratingLbl: UILabel!
    
    @IBOutlet weak var timeLbl: UILabel!
    
    @IBOutlet weak var likeBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layer.cornerRadius = 30.0
        layer.masksToBounds = true
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.gray.cgColor
        
        foodImgVw.layer.cornerRadius = 15
        likeBtn.layer.cornerRadius = 25
        priceLbl.layer.cornerRadius = 15
        self.priceLbl.clipsToBounds = true
    }

}

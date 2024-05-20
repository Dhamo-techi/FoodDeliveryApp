//
//  PopularFoodsViewAllCell.swift
//  DeliveryApp
//
//  Created by MAC PRO on 19/02/24.
//

import UIKit

class PopularFoodsViewAllCell: UICollectionViewCell {
    
    var isTinted = false
    
    var defaultButtonColor: UIColor!

    
    @IBOutlet weak var foodImgvw: UIImageView!
    
    @IBOutlet weak var foodNameLbl: UILabel!
    
    @IBOutlet weak var foodPriceLb: UILabel!
    
    @IBOutlet weak var ratingLbl: UILabel!
    
    @IBOutlet weak var foodtimeLbl: UILabel!
    
    @IBOutlet weak var savedBtn: UIButton!
   
    override func layoutSubviews() {
        super.layoutSubviews()
            
        layer.cornerRadius = 30.0
        layer.masksToBounds = true
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.gray.cgColor
        
        self.foodImgvw.layer.cornerRadius = 25.0
        self.savedBtn.layer.cornerRadius = 30.0
        
        
        }
  
   
    


}

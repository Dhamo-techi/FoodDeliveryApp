//
//  PopularFoodsCell.swift
//  DeliveryApp
//
//  Created by MAC PRO on 02/02/24.
//

import UIKit

class PopularFoodsCell: UICollectionViewCell {
    
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
            
        layer.cornerRadius = 40.0
        layer.masksToBounds = true
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.gray.cgColor
        
        self.foodImgvw.layer.cornerRadius = 40.0
        self.savedBtn.layer.cornerRadius = 30.0
        self.savedBtn.tintColor = UIColor.lightGray
        

        
        }
  
    @IBAction func savedBtnTapped(_ sender: Any) {
        
        if isTinted {
            savedBtn.tintColor = UIColor.lightGray
        } else {
            savedBtn.tintColor = UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1)
        }
        isTinted.toggle()
        
    }
    
    
}

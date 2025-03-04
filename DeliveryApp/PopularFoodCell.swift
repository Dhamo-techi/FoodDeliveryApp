//
//  PopularFoodCell.swift
//  DeliveryApp
//
//  Created by MAC PRO on 14/02/24.
//

import UIKit

class PopularFoodCell: UICollectionViewCell {
   
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
        
        self.foodImgvw.layer.cornerRadius = 30.0
        self.savedBtn.layer.cornerRadius = 30.0
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(saveBtn(_:)))
                savedBtn.addGestureRecognizer(tapGesture)
        
        }
  
    @IBAction func saveBtn(_ sender: Any) {
        
        if isTinted {
            savedBtn.tintColor = UIColor.lightGray
        } else {
            savedBtn.tintColor = UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1)
        }
        isTinted.toggle()
    }
    

}

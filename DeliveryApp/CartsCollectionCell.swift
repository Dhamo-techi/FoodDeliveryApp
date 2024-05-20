//
//  CartsCollectionCell.swift
//  DeliveryApp
//
//  Created by MAC PRO on 19/03/24.
//

import UIKit

class CartsCollectionCell: UICollectionViewCell {

    
    @IBOutlet weak var foodImgVw: UIImageView!
    
    @IBOutlet weak var foodnameLbl: UILabel!
    
    @IBOutlet weak var foodAbtLbl: UILabel!
    
    @IBOutlet weak var foodPriceLbl: UILabel!
    
    @IBOutlet weak var countView: UIView!
    
    @IBOutlet weak var itemMinusBtn: UIButton!
    
    @IBOutlet weak var itemCountLbl: UILabel!
    
    @IBOutlet weak var itemPlusBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.cornerRadius = 30
        layer.masksToBounds = true
        
        self.countView.layer.cornerRadius = 15
        self.countView.layer.masksToBounds = true
    }
    

}

//
//  CategoryCell.swift
//  DeliveryApp
//
//  Created by MAC PRO on 30/01/24.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var CnameLbl: UILabel!
    
    @IBOutlet weak var CimgvW: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
            
        layer.cornerRadius = 30.0
        layer.masksToBounds = true
        }
    
    
    
}

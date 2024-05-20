//
//  CategoriesCell.swift
//  DeliveryApp
//
//  Created by MAC PRO on 18/03/24.
//

import UIKit

class ItemCategoriesCell: UITableViewCell {

    @IBOutlet weak var foodimageVw: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.backgroundColor = .none
        layer.cornerRadius = 20.0
        clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

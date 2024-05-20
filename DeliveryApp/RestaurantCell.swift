//
//  RestaurantCell.swift
//  DeliveryApp
//
//  Created by MAC PRO on 28/02/24.
//

import UIKit

class RestaurantCell: UICollectionViewCell {
    @IBOutlet weak var rstNameLbl: UILabel!
    
    
    @IBOutlet weak var RstFood1ImgVw: UIImageView!
    
    @IBOutlet weak var RstFood2ImgVw: UIImageView!
    
    @IBOutlet weak var RstFood3ImgVw: UIImageView!
    
    @IBOutlet weak var rstImgCtLbl: UILabel!
    
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.view.layer.cornerRadius = 30
        
        self.RstFood1ImgVw.layer.cornerRadius = 20
        self.RstFood2ImgVw.layer.cornerRadius = 20
        self.RstFood3ImgVw.layer.cornerRadius = 20
        self.rstImgCtLbl.layer.cornerRadius = 20
        self.rstImgCtLbl.layer.masksToBounds = true

    }

}

//
//  PopularRestaurntCell.swift
//  DeliveryApp
//
//  Created by MAC PRO on 08/02/24.
//

import UIKit

class PopularRestaurntCell: UITableViewCell {
    
    var isTinted = false
        
    @IBOutlet weak var reataurantFoodImgVw: UIImageView!
    
    @IBOutlet weak var restaurntNameLbl: UILabel!
    
    @IBOutlet weak var restaurantRatingLbl: UILabel!
    
    @IBOutlet weak var RestaurntPrepareTimeLbl: UILabel!
    
    @IBOutlet weak var offertagLbl: UILabel!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    
    @IBOutlet weak var vegBtn: UIButton!
    
    
    @IBOutlet weak var nonvegBtn: UIButton!
    
    
    @IBOutlet weak var fastfoodBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layer.backgroundColor = .none
        layer.cornerRadius = 40.0
        clipsToBounds = true
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.gray.cgColor
        
//        contentView.layoutMargins = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        
        self.reataurantFoodImgVw.layer.cornerRadius = 30
        self.saveBtn.layer.cornerRadius = 30
        self.vegBtn.layer.cornerRadius = 10
        self.nonvegBtn.layer.cornerRadius = 10
        self.fastfoodBtn.layer.cornerRadius = 10
        self.offertagLbl.layer.cornerRadius = 15
        self.offertagLbl.layer.masksToBounds = true
        self.saveBtn.tintColor = UIColor.lightGray

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    @IBAction func nonvegBtnTapped(_ sender: Any) {
    }
    
    @IBAction func fastfoodBtnTapped(_ sender: Any) {
    }
    
    @IBAction func vegBtnTapped(_ sender: Any) {
    }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        
        
        if isTinted {
            saveBtn.tintColor = UIColor.lightGray
        } else {
            saveBtn.tintColor = UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1)
        }
        isTinted.toggle()
    }


    
    
}

//
//  FoodVC.swift
//  DeliveryApp
//
//  Created by MAC PRO on 29/02/24.
//

import UIKit

class FoodOrderVC: UIViewController {
    
    var isTinted = false

    @IBOutlet weak var FoodImgVw: UIImageView!
    
    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var ratingView: UIView!
    
    @IBOutlet weak var ratingLbl: UILabel!
    
    @IBOutlet weak var likeBtn: UIButton!
    
    @IBOutlet weak var foodNameLbl: UILabel!
    
    @IBOutlet weak var foodPriceLbl: UILabel!
    
    @IBOutlet weak var foodCountLbl: UILabel!
    
    @IBOutlet weak var addBtn: UIButton!
    
    @IBOutlet weak var reduceBtn: UIButton!
    
    @IBOutlet weak var addToCartBtn: UIButton!
    
    @IBOutlet weak var AboutEdtTxt: UITextView!
    
    @IBOutlet weak var backBtn: UIButton!
    
    var recieveFoodImg = UIImage()
    var recieveFoodPrice = Int()
    var recieveFoodName = String()
    var recieveFoodRating = String()
    
    var count: Int = 1 {
        didSet {
            foodCountLbl.text = "\(count)"
            updatePrice()
        }
    }
    
    var price : Int = 0 {
        didSet {
            foodPriceLbl.text = "\(self.recieveFoodPrice)"
            updatePrice()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.myView.layer.cornerRadius = 60
        self.myView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        self.ratingView.layer.cornerRadius = 30
        self.likeBtn.layer.cornerRadius = 30
        self.addBtn.layer.cornerRadius = 30
        self.reduceBtn.layer.cornerRadius = 30
        self.addToCartBtn.layer.cornerRadius = 30
        self.backBtn.layer.cornerRadius = 10
        
        
        self.reduceBtn.layer.borderWidth = 2
        self.reduceBtn.layer.borderColor = UIColor.black.cgColor
        
        self.addBtn.layer.borderWidth = 2
        self.addBtn.layer.borderColor = UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1).cgColor
        
        self.AboutEdtTxt.isUserInteractionEnabled = false
        
        self.likeBtn.tintColor = UIColor.lightGray
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(likeBtnTapped(_:)))
        likeBtn.addGestureRecognizer(tapGesture)
        
        self.foodCountLbl.text = "\(count)"
        
        let initialPrice = self.recieveFoodPrice
        foodPriceLbl.text = "\(initialPrice)"
        price = initialPrice
        updatePrice()
        
        self.foodNameLbl.text = self.recieveFoodName
        self.ratingLbl.text = self.recieveFoodRating
        self.FoodImgVw.image = self.recieveFoodImg
        
        
        self.navigationController?.isNavigationBarHidden = true
        BackGesture.addBackGesture(to: self, action: #selector(handleSwipeGesture))
        
        self.likeBtn.tintColor = isTinted == true ? UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1) : UIColor.lightGray
        
    }
    
    @objc func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            // Perform pop action to go back
            navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func likeBtnTapped(_ sender: Any) {
        if isTinted {
            likeBtn.tintColor = UIColor.lightGray
        } else {
            likeBtn.tintColor = UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1)
        }
        isTinted.toggle()
    }
    
    @IBAction func addBtnTapped(_ sender: Any) {
        count += 1
    }
    
    @IBAction func reduceBtnTapped(_ sender: Any) {
        if count > 1 {
            count -= 1
        }
    }
    
    @IBAction func addToCartBtnTapped(_ sender: Any) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
                
                let addMoreAction = UIAlertAction(title: "Add More", style: .default) { (_) in
                    
                    
                    self.navigationController?.popViewController(animated: true)
                }
                alertController.addAction(addMoreAction)
                
                let continueAction = UIAlertAction(title: "Continue", style: .default) { (_) in
                    let vc = self.storyboard?.instantiateViewController(identifier: "OrderVC")
                    
                    self.navigationController?.pushViewController(vc!, animated: true)
                    print("Continue clicked")
                }
                alertController.addAction(continueAction)
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                
                self.present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
        
    func updatePrice() {
        let totalPrice = count * price
        self.foodPriceLbl.text = "\(totalPrice)"
    }
    
}

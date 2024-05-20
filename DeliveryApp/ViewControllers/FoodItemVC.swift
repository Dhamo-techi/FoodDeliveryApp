//
//  FoodItemVC.swift
//  DeliveryApp
//
//  Created by MAC PRO on 12/03/24.
//

import UIKit

class FoodItemVC: UIViewController {

    @IBOutlet weak var itemTitleLbl: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBOutlet weak var notifyBtn: UIButton!
    
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    var fooditems = [[String : Any]]()
    
    var PassFoodImg = UIImage()
    var PassFoodPrice = Int()
    var PassFoodName = String()
    var PassFoodRating = String()
    
    var isTinted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.fooditems = [["ItemImg" : "Dosa", "ItemName" : "Dosa(Roast)", "ItemAbout" : "Maked with love", "ItemRating" : "4.9", "ItemTiming" : "25-30 Min", "ItemPrice" : "Rs.80","ItempassPrice" : 80],["ItemImg" : "Idli", "ItemName" : "Idli(2 Pieces)", "ItemAbout" : "Maked with love", "ItemRating" : "4.2", "ItemTiming" : "20-30 Min", "ItemPrice" : "Rs.30","ItempassPrice" : 30],["ItemImg" : "poori", "ItemName" : "Poori(2 Pieces)", "ItemAbout" : "Maked with love", "ItemRating" : "4.6", "ItemTiming" : "30-40 Min", "ItemPrice" : "Rs.70","ItempassPrice" : 70],["ItemImg" : "chapati", "ItemName" : "Chapathi(2 Pieces)", "ItemAbout" : "Maked with love", "ItemRating" : "4.8", "ItemTiming" : "40-45 Min", "ItemPrice" : "Rs.60","ItempassPrice" : 60],["ItemImg" : "Rst2", "ItemName" : "Meals", "ItemAbout" : "Maked with love", "ItemRating" : "4.9", "ItemTiming" : "25-30 Min", "ItemPrice" : "Rs.180","ItempassPrice" : 180]]
        
        self.navigationController?.isNavigationBarHidden = true
        BackGesture.addBackGesture(to: self, action: #selector(handleSwipeGesture))
        
        self.backBtn.layer.borderWidth = 2.0
        self.backBtn.layer.borderColor = UIColor.secondarySystemFill.cgColor
        
        self.backBtn.layer.cornerRadius = 15
        
        self.itemCollectionView.backgroundColor = .none
        
        self.itemCollectionView.register(UINib(nibName: "ItemsCell", bundle: nil), forCellWithReuseIdentifier: "ItemsCell")
        self.itemCollectionView.showsVerticalScrollIndicator = false
        
        let layout = CustomVerticalFlowLayout()
        itemCollectionView.collectionViewLayout = layout
        itemCollectionView.dataSource = self
        
    }
    
    @objc func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            // Perform pop action to go back
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func searchBtnTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "SearchVC")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func notifyBtnTapped(_ sender: Any) {
    }
    
}

extension FoodItemVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.fooditems.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemsCell", for: indexPath) as! ItemsCell
        cell.itemImgVw.image = UIImage(named: self.fooditems[indexPath.item]["ItemImg"] as! String)
        cell.itemNameLbl.text = self.fooditems[indexPath.item]["ItemName"] as? String
        cell.itemAbtLbl.text = self.fooditems[indexPath.item]["ItemAbout"] as? String
        cell.itemPriceLbl.text = self.fooditems[indexPath.item]["ItemPrice"] as? String
        cell.itemRatingLbl.text = self.fooditems[indexPath.item]["ItemRating"] as? String
        cell.itemTimingLbl.text = self.fooditems[indexPath.item]["ItemTiming"] as? String

        cell.ItemlikeBtn.addTarget(self, action: #selector(saveBtn(_:)), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - 1 * 10) / 1.0
        let height = CGFloat(190.0)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.PassFoodName = self.fooditems[indexPath.item]["ItemName"] as! String
        self.PassFoodPrice = self.fooditems[indexPath.item]["ItempassPrice"] as! Int
        self.PassFoodRating = self.fooditems[indexPath.item]["ItemRating"] as! String
        self.PassFoodImg = UIImage(named: self.fooditems[indexPath.item]["ItemImg"] as! String)!
            
        let desvc = storyboard?.instantiateViewController(identifier: "FoodVC") as! FoodOrderVC
        
        desvc.recieveFoodName = self.PassFoodName
        desvc.recieveFoodPrice = self.PassFoodPrice
        desvc.recieveFoodRating = self.PassFoodRating
        desvc.recieveFoodImg = self.PassFoodImg
        desvc.isTinted = self.isTinted

        self.navigationController?.pushViewController(desvc, animated: true)
    }
    
    @objc func saveBtn(_ sender: UIButton) {
        
        if isTinted {
            sender.tintColor = UIColor.lightGray
        } else {
            sender.tintColor = UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1)
        }
        isTinted.toggle()
    }
    
    
}

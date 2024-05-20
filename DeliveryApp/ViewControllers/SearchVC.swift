//
//  SearchVC.swift
//  DeliveryApp
//
//  Created by MAC PRO on 26/02/24.
//

import UIKit

class SearchVC: UIViewController, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var searchTxtFld: UITextField!
    
    @IBOutlet weak var inSearchBtn: UIButton!
    
    @IBOutlet weak var foodsBtn: UIButton!
    
    @IBOutlet weak var restaurantBtn: UIButton!
    
    @IBOutlet weak var commonCollectionVW: UICollectionView!
    
    var isTinted = false
    
    var selectedButtonIndex = 0
    
    var PassFoodImg = UIImage()
    var PassFoodPrice = Int()
    var PassFoodName = String()
    var PassFoodRating = String()
    
    var Foodscollections = [[String : Any]]()
    let itemsPerRow: CGFloat = 2
    let sectionInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    var RestaurantCollections = [[String : String]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
        BackGesture.addBackGesture(to: self, action: #selector(handleSwipeGesture))
        
        self.backBtn.layer.borderWidth = 2.0
        self.backBtn.layer.borderColor = UIColor.secondarySystemFill.cgColor
        
        self.backBtn.layer.cornerRadius = 15
        
        self.inSearchBtn.layer.cornerRadius = 15
        self.searchTxtFld.layer.cornerRadius = 15
        
        self.restaurantBtn.layer.cornerRadius = 30
        self.foodsBtn.layer.cornerRadius = 30
        
        let searchpadding = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 23))
        self.searchTxtFld.leftView = searchpadding
        self.searchTxtFld.leftViewMode = .always
        self.searchTxtFld.delegate = self
        
        self.commonCollectionVW.register(UINib(nibName: "FoodsCell", bundle: nil), forCellWithReuseIdentifier: "FoodsCell")
        
        self.Foodscollections = [["name" : "Dosa(Roast)","image" : "Dosa","price" : "Rs.80","PassFoodPrice" : 80,"rating" : "4.4", "time" : "30 mins"],["name" : "Idli(2 Pieces)","image" : "Idli","price" : "Rs.30","PassFoodPrice" : 30,"rating" : "5.0", "time" : "20 mins"],["name" : "Poori(2 Pieces)","image" : "poori","price" : "Rs.70","PassFoodPrice" : 70,"rating" : "4.5", "time" : "40 mins"],["name" : "Chapathi(2 Pieces)","image" : "chapati","price" : "Rs.60","PassFoodPrice" : 60,"rating" : "5.0", "time" : "30 mins"],["name" : "Meals","image" : "Rst2","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.4", "time" : "60 mins"],["name" : "Burger","image" : "Rst3","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"],["name" : "Pizza","image" : "Rst4","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"],["name" : "Dosa(Roast)","image" : "Dosa","price" : "Rs.80","PassFoodPrice" : 80,"rating" : "4.4", "time" : "30 mins"],["name" : "Idli(2 Pieces)","image" : "Idli","price" : "Rs.30","PassFoodPrice" : 30,"rating" : "5.0", "time" : "20 mins"],["name" : "Poori(2 Pieces)","image" : "poori","price" : "Rs.70","PassFoodPrice" : 70,"rating" : "4.5", "time" : "40 mins"],["name" : "Chapathi(2 Pieces)","image" : "chapati","price" : "Rs.60","PassFoodPrice" : 60,"rating" : "5.0", "time" : "30 mins"],["name" : "Meals","image" : "Rst2","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.4", "time" : "60 mins"],["name" : "Burger","image" : "Rst3","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"],["name" : "Pizza","image" : "Rst4","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"],["name" : "Dosa(Roast)","image" : "Dosa","price" : "Rs.80","PassFoodPrice" : 80,"rating" : "4.4", "time" : "30 mins"],["name" : "Idli(2 Pieces)","image" : "Idli","price" : "Rs.30","PassFoodPrice" : 30,"rating" : "5.0", "time" : "20 mins"],["name" : "Poori(2 Pieces)","image" : "poori","price" : "Rs.70","PassFoodPrice" : 70,"rating" : "4.5", "time" : "40 mins"],["name" : "Chapathi(2 Pieces)","image" : "chapati","price" : "Rs.60","PassFoodPrice" : 60,"rating" : "5.0", "time" : "30 mins"],["name" : "Meals","image" : "Rst2","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.4", "time" : "60 mins"],["name" : "Burger","image" : "Rst3","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"],["name" : "Pizza","image" : "Rst4","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"]]
        self.commonCollectionVW.register(UINib(nibName: "RestaurantCell", bundle: nil), forCellWithReuseIdentifier: "RestaurantCell")
        
        self.RestaurantCollections = [["RstName" : "Mc Donald's","FirstImg" : "Rst8","secondImg" : "Rst6","thirdImg" : "Rst5","ImgCount" : "19+"],["RstName" : "Mc Donald's","FirstImg" : "Rst8","secondImg" : "Rst6","thirdImg" : "Rst5","ImgCount" : "19+"],["RstName" : "Mc Donald's","FirstImg" : "Rst8","secondImg" : "Rst6","thirdImg" : "Rst5","ImgCount" : "19+"]]
        
        
        
        let layout = CustomVerticalFlowLayout()
        commonCollectionVW.collectionViewLayout = layout
        commonCollectionVW.dataSource = self
        
        foodsBtn.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        restaurantBtn.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        
    }
    
    @objc func tapButton(_ sender: UIButton) {
        
        if sender == foodsBtn {
            foodsBtn.backgroundColor = UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1)
            foodsBtn.setTitleColor(.white, for: .normal)
            
            restaurantBtn.backgroundColor = .white
            restaurantBtn.setTitleColor(.black, for: .normal)
        } else if sender == restaurantBtn {
            foodsBtn.backgroundColor = .white
            foodsBtn.setTitleColor(.black, for: .normal)
            
            restaurantBtn.backgroundColor = UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1)
            restaurantBtn.setTitleColor(.white, for: .normal)
        }
    }
    
    @objc func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            // Perform pop action to go back
            navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func likeBtnTapped(_ sender: UIButton) {
        
        if isTinted {
            sender.tintColor = UIColor.lightGray
        } else {
            sender.tintColor = UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1)
        }
        isTinted.toggle()
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func searchBtnTapped(_ sender: Any) {
        self.searchTxtFld.becomeFirstResponder()

    }
    
    @IBAction func notificationBtnTapped(_ sender: Any) {
    }
    
    @IBAction func inSearchBtnTapped(_ sender: Any) {
    }
    
    @IBAction func foodsBtnTapped(_ sender: Any) {
        
        selectedButtonIndex = 0
        commonCollectionVW.reloadData()
    }
    
    @IBAction func restaurantBtnTapped(_ sender: Any) {
        selectedButtonIndex = 1
        commonCollectionVW.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == searchTxtFld{
            self.searchTxtFld.resignFirstResponder()
        }
        return true
    }
    
    
    
}

extension SearchVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if selectedButtonIndex == 0 {
            return Foodscollections.count
        } else {
            return RestaurantCollections.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if selectedButtonIndex == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodsCell", for: indexPath) as! FoodsCell
            cell.foodNameLbl.text = self.Foodscollections[indexPath.item]["name"] as? String
            cell.foodImgVw.image = UIImage(named: self.Foodscollections[indexPath.item]["image"]! as! String)
            cell.priceLbl.text = self.Foodscollections[indexPath.item]["price"] as? String
            cell.timeLbl.text = self.Foodscollections[indexPath.item]["time"] as? String
            cell.ratingLbl.text = self.Foodscollections[indexPath.item]["rating"] as? String
            
            cell.likeBtn.addTarget(self, action: #selector(likeBtnTapped(_:)), for: .touchUpInside)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell

            cell.rstNameLbl.text = self.RestaurantCollections[indexPath.item]["RstName"]
            cell.RstFood1ImgVw.image = UIImage(named: self.RestaurantCollections[indexPath.item]["FirstImg"]!)
            cell.RstFood2ImgVw.image = UIImage(named: self.RestaurantCollections[indexPath.item]["secondImg"]!)
            cell.RstFood3ImgVw.image = UIImage(named: self.RestaurantCollections[indexPath.item]["thirdImg"]!)
            cell.rstImgCtLbl.text = self.RestaurantCollections[indexPath.item]["ImgCount"]

            
            return cell

        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if selectedButtonIndex == 0 {
            let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
            let availableWidth = view.frame.width - paddingSpace
            let widthPerItem = availableWidth / itemsPerRow
            return CGSize(width: widthPerItem, height: 340)
        } else{
            let width = (collectionView.frame.size.width - 1 * 10) / 1.0
            let height = CGFloat(380.0)
            return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if selectedButtonIndex == 0 {
            return sectionInsets.right
        } else  {
            return 10.0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if selectedButtonIndex == 0 {
            return sectionInsets
        }
        else{
            return UIEdgeInsets(top: 0, left: 10.0, bottom: 10.0, right: 10.0)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedButtonIndex == 0{
        self.PassFoodName = self.Foodscollections[indexPath.item]["name"] as! String
        self.PassFoodPrice = self.Foodscollections[indexPath.item]["PassFoodPrice"] as! Int
        self.PassFoodRating = self.Foodscollections[indexPath.item]["rating"] as! String
        self.PassFoodImg = UIImage(named: self.Foodscollections[indexPath.item]["image"] as! String)! 
            
        let desvc = storyboard?.instantiateViewController(identifier: "FoodVC") as! FoodOrderVC
        
        desvc.recieveFoodName = self.PassFoodName
        desvc.recieveFoodPrice = self.PassFoodPrice
        desvc.recieveFoodRating = self.PassFoodRating
        desvc.recieveFoodImg = self.PassFoodImg
        desvc.isTinted = self.isTinted


        self.navigationController?.pushViewController(desvc, animated: true)
        }else{
            
        }
    }
    
}


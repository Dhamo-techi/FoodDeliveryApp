//
//  RestaurantVC.swift
//  DeliveryApp
//
//  Created by MAC PRO on 04/03/24.
//

import UIKit


class RestaurantVC: UIViewController {
    
    var isTinted = false
    
    @IBOutlet weak var circleView: UIView!
    
    @IBOutlet weak var rectangleView: UIView!
    
    @IBOutlet weak var scollView: UIView!
    
    @IBOutlet weak var foodImgVw: UIImageView!
    
    @IBOutlet weak var LogoImgVw: UIImageView!
    
    @IBOutlet weak var RstNameLbl: UILabel!
    
    @IBOutlet weak var RstAddressLbl: UILabel!
    
    @IBOutlet weak var RstofferLbl: UILabel!
    
    @IBOutlet weak var RstRatingLbl: UILabel!
    
    @IBOutlet weak var RstFtimingLbl: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var vegBtn: UIButton!
    
    @IBOutlet weak var NonVegBtn: UIButton!
    
    @IBOutlet weak var fastFoodBtn: UIButton!
    
    @IBOutlet weak var saveBtn: UIButton!
        
    @IBOutlet weak var foodItemBtn: UIButton!
    
    @IBOutlet weak var juiceBtn: UIButton!
    
    @IBOutlet weak var desertBtn: UIButton!
    
    @IBOutlet weak var cakeBtn: UIButton!
    
    @IBOutlet weak var snackBtn: UIButton!
    
    @IBOutlet weak var PopluarItemLbl: UILabel!
    
    @IBOutlet weak var viewAllBtn: UIButton!
    
    @IBOutlet weak var ItemsCollectionView: UICollectionView!
    
    var selectedButtonIndex = 0
    let itemsPerRow: CGFloat = 2
    let sectionInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    var fooditems = [[String : Any]]()
    var juiceitems = [[String : Any]]()
    var deserrtitems = [[String : Any]]()
    var cakeitems = [[String : Any]]()
    var snackitems = [[String : Any]]()
    
    var PassFoodImg = UIImage()
    var PassFoodPrice = Int()
    var PassFoodName = String()
    var PassFoodRating = String()
    
    var recieveRstImg = UIImage()
    var recieveRstName = String()
    var recieveRstRating = String()
    var recieveRstTiming = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
    
        self.backBtn.layer.cornerRadius = 10
        
        self.circleView.layer.cornerRadius = 35
        self.circleView.clipsToBounds = true
        self.rectangleView.layer.cornerRadius = 20
        
        self.LogoImgVw.layer.cornerRadius = 30
        self.foodImgVw.layer.cornerRadius = 20
        self.saveBtn.layer.cornerRadius = 25
        self.vegBtn.layer.cornerRadius = 10
        self.NonVegBtn.layer.cornerRadius = 10
        self.fastFoodBtn.layer.cornerRadius = 10
        
        
        self.foodItemBtn.layer.cornerRadius = 35
        self.juiceBtn.layer.cornerRadius = 35
        self.desertBtn.layer.cornerRadius = 35
        self.cakeBtn.layer.cornerRadius = 35
        self.snackBtn.layer.cornerRadius = 35

        foodItemBtn.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        juiceBtn.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        desertBtn.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        cakeBtn.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        snackBtn.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)

        self.fooditems = [["ItemImg" : "Dosa", "ItemName" : "Dosa(Roast)", "ItemAbout" : "Maked with love", "ItemRating" : "4.9", "ItemTiming" : "25-30 Min", "ItemPrice" : "Rs.80","ItempassPrice" : 80],["ItemImg" : "Idli", "ItemName" : "Idli(2 Pieces)", "ItemAbout" : "Maked with love", "ItemRating" : "4.2", "ItemTiming" : "20-30 Min", "ItemPrice" : "Rs.30","ItempassPrice" : 30],["ItemImg" : "poori", "ItemName" : "Poori(2 Pieces)", "ItemAbout" : "Maked with love", "ItemRating" : "4.6", "ItemTiming" : "30-40 Min", "ItemPrice" : "Rs.70","ItempassPrice" : 70],["ItemImg" : "chapati", "ItemName" : "Chapathi(2 Pieces)", "ItemAbout" : "Maked with love", "ItemRating" : "4.8", "ItemTiming" : "40-45 Min", "ItemPrice" : "Rs.60","ItempassPrice" : 60],["ItemImg" : "Rst2", "ItemName" : "Meals", "ItemAbout" : "Maked with love", "ItemRating" : "4.9", "ItemTiming" : "25-30 Min", "ItemPrice" : "Rs.180","ItempassPrice" : 180]]
        
        self.juiceitems = [["ItemImg" : "Apple", "ItemName" : "Fresh Apple Juice", "ItemAbout" : "Maked with love", "ItemRating" : "4.2", "ItemTiming" : "20-30 Min", "ItemPrice" : "Rs.80","ItempassPrice" : 80],["ItemImg" : "Strawberry", "ItemName" :  "Strawberry Juice", "ItemAbout" : "Maked with love", "ItemRating" : "4.6", "ItemTiming" : "30-40 Min", "ItemPrice" : "Rs.120","ItempassPrice" : 120],["ItemImg" : "Grape", "ItemName" : "Fresh Grape Juice", "ItemAbout" : "Maked with love", "ItemRating" : "4.8", "ItemTiming" : "40-45 Min", "ItemPrice" : "Rs.80","ItempassPrice" : 80],["ItemImg" : "Pineapple", "ItemName" : "Fresh Pineapple Juice", "ItemAbout" : "Maked with love", "ItemRating" : "4.9", "ItemTiming" : "25-30 Min", "ItemPrice" : "Rs.80","ItempassPrice" : 80],["ItemImg" : "Orange", "ItemName" : "Fresh Orange Juice", "ItemAbout" : "Maked with love", "ItemRating" : "4.9", "ItemTiming" : "25-30 Min", "ItemPrice" : "Rs.60","ItempassPrice" : 60]]
        
        self.deserrtitems = [["ItemImg" : "chocolate Desert", "ItemName" : "chocolate Desert", "ItemAbout" : "Maked with love", "ItemRating" : "4.9", "ItemTiming" : "25-30 Min", "ItemPrice" : "Rs.80","ItempassPrice" : 80],["ItemImg" : "Amaretto brulee", "ItemName" : "Amaretto brulee", "ItemAbout" : "Maked with love", "ItemRating" : "4.2", "ItemTiming" : "20-30 Min", "ItemPrice" : "Rs.30","ItempassPrice" : 30],["ItemImg" : "Chocolate banoffee pie", "ItemName" : "Chocolate banoffee pie", "ItemAbout" : "Maked with love", "ItemRating" : "4.6", "ItemTiming" : "30-40 Min", "ItemPrice" : "Rs.70","ItempassPrice" : 70],["ItemImg" : "Mangomisu", "ItemName" : "Mangomisu", "ItemAbout" : "Maked with love", "ItemRating" : "4.8", "ItemTiming" : "40-45 Min", "ItemPrice" : "Rs.60","ItempassPrice" : 60],["ItemImg" : "Black forest trifles", "ItemName" : "Black forest trifles", "ItemAbout" : "Maked with love", "ItemRating" : "4.9", "ItemTiming" : "25-30 Min", "ItemPrice" : "Rs.180","ItempassPrice" : 180]]
        
        self.cakeitems = [["ItemImg" : "blackforest Cake", "ItemName" : "Blackforest Cake", "ItemAbout" : "Maked with love", "ItemRating" : "4.9", "ItemTiming" : "25-30 Min", "ItemPrice" : "Rs.80","ItempassPrice" : 80],["ItemImg" : "Redwelvet Cake", "ItemName" : "Redwelvet Cake", "ItemAbout" : "Maked with love", "ItemRating" : "4.2", "ItemTiming" : "20-30 Min", "ItemPrice" : "Rs.30","ItempassPrice" : 30],["ItemImg" : "Strawberry Cake", "ItemName" : "Strawberry Cake", "ItemAbout" : "Maked with love", "ItemRating" : "4.6", "ItemTiming" : "30-40 Min", "ItemPrice" : "Rs.70","ItempassPrice" : 70],["ItemImg" : "Chocolate Cake", "ItemName" : "Chocolate Cake", "ItemAbout" : "Maked with love", "ItemRating" : "4.8", "ItemTiming" : "40-45 Min", "ItemPrice" : "Rs.60","ItempassPrice" : 60],["ItemImg" : "Vanilla Cake", "ItemName" : "Vanilla Cake", "ItemAbout" : "Maked with love", "ItemRating" : "4.9", "ItemTiming" : "25-30 Min", "ItemPrice" : "Rs.180","ItempassPrice" : 180]]
        
        self.snackitems = [["ItemImg" : "Samosa", "ItemName" : "Samosa", "ItemAbout" : "Maked with love", "ItemRating" : "4.9", "ItemTiming" : "25-30 Min", "ItemPrice" : "Rs.80","ItempassPrice" : 80],["ItemImg" : "Pani Puri", "ItemName" : "Pani Puri", "ItemAbout" : "Maked with love", "ItemRating" : "4.2", "ItemTiming" : "20-30 Min", "ItemPrice" : "Rs.30","ItempassPrice" : 30],["ItemImg" : "Pakora", "ItemName" : "Pakora", "ItemAbout" : "Maked with love", "ItemRating" : "4.6", "ItemTiming" : "30-40 Min", "ItemPrice" : "Rs.70","ItempassPrice" : 70],["ItemImg" : "French Fries", "ItemName" : "French Fries", "ItemAbout" : "Maked with love", "ItemRating" : "4.8", "ItemTiming" : "40-45 Min", "ItemPrice" : "Rs.60","ItempassPrice" : 60],["ItemImg" : "Potato Chips", "ItemName" : "Potato Chips", "ItemAbout" : "Maked with love", "ItemRating" : "4.9", "ItemTiming" : "25-30 Min", "ItemPrice" : "Rs.180","ItempassPrice" : 180]]
        
        self.ItemsCollectionView.register(UINib(nibName: "FoodsCell", bundle: nil), forCellWithReuseIdentifier: "FoodsCell")
        
        let layout = CustomVerticalFlowLayout()
        ItemsCollectionView.collectionViewLayout = layout
        ItemsCollectionView.dataSource = self
        
        self.ItemsCollectionView.backgroundColor = .none
        
        self.RstNameLbl.text = self.recieveRstName
        self.foodImgVw.image = self.recieveRstImg
        self.RstRatingLbl.text = self.recieveRstRating
        self.RstFtimingLbl.text = self.recieveRstTiming

    }
    
    
    @IBAction func vegBtnTapped(_ sender: Any) {
    }
    
    @IBAction func fastFoodBtnTapped(_ sender: Any) {
    }
    
    @IBAction func NonVegBtnTapped(_ sender: Any) {
    }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
    }
    
    @objc func tapButton(_ sender: UIButton) {
        
        if sender == foodItemBtn {
            foodItemBtn.backgroundColor = UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1)
            foodItemBtn.setTitleColor(.white, for: .normal)
            
            
            
            juiceBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            juiceBtn.setTitleColor( UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
            
            desertBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            desertBtn.setTitleColor(UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
            
            cakeBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            cakeBtn.setTitleColor(UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
            
            snackBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            snackBtn.setTitleColor(UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
            
        } else if sender == juiceBtn {
            juiceBtn.backgroundColor = UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1)
            juiceBtn.setTitleColor(.white, for: .normal)
            
            
            
            foodItemBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            foodItemBtn.setTitleColor(UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
            
            desertBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            desertBtn.setTitleColor(UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
            
            cakeBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            cakeBtn.setTitleColor(UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
            
            snackBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            snackBtn.setTitleColor(UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
        }
        else if sender == desertBtn {
            
            desertBtn.backgroundColor = UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1)
            desertBtn.setTitleColor(.white, for: .normal)
            
            
            
            foodItemBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            foodItemBtn.setTitleColor(UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
            
            juiceBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            juiceBtn.setTitleColor(UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
            
            cakeBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            cakeBtn.setTitleColor(UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
            
            snackBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            snackBtn.setTitleColor(UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
        }
        else if sender == cakeBtn {
            
            cakeBtn.backgroundColor = UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1)
            cakeBtn.setTitleColor(.white, for: .normal)
            
            foodItemBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            foodItemBtn.setTitleColor(UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
            
            juiceBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            juiceBtn.setTitleColor(UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
            
            desertBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            desertBtn.setTitleColor(UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
            
            snackBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            snackBtn.setTitleColor(UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
        }
        else if sender == snackBtn {
            
            snackBtn.backgroundColor = UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1)
            snackBtn.setTitleColor(.white, for: .normal)
            
            
            
            foodItemBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            foodItemBtn.setTitleColor(UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
            
            juiceBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            juiceBtn.setTitleColor(UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
            
            desertBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            desertBtn.setTitleColor(UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
            
            cakeBtn.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
            cakeBtn.setTitleColor(UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1), for: .normal)
        }
        
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func foodItemBtnTapped(_ sender: Any) {
        selectedButtonIndex = 0
        ItemsCollectionView.reloadData()
        self.PopluarItemLbl.text = "Popular Foods"
        
    }
    
    @IBAction func juiceBtnTapped(_ sender: Any) {
        selectedButtonIndex = 1
        ItemsCollectionView.reloadData()
        self.PopluarItemLbl.text = "Popular Juice"

    }
    
    @IBAction func desertBtnTapped(_ sender: Any) {
        selectedButtonIndex = 2
        ItemsCollectionView.reloadData()
        self.PopluarItemLbl.text = "Popular Dessert"

    }
    
    @IBAction func cakeBtnTapped(_ sender: Any) {
        selectedButtonIndex = 3
        ItemsCollectionView.reloadData()
        self.PopluarItemLbl.text = "Popular Cake"

    }
    
    @IBAction func snacksBtnTapped(_ sender: Any) {
        selectedButtonIndex = 4
        ItemsCollectionView.reloadData()
        self.PopluarItemLbl.text = "Popular Snacks"
    }
    
    @IBAction func viewAllBtnTapped(_ sender: Any) {
        
        if selectedButtonIndex == 0{
            let vc = storyboard?.instantiateViewController(identifier: "FoodItemVC")
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        else if selectedButtonIndex == 1{
            let vc = storyboard?.instantiateViewController(identifier: "JuiceItemVC")
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        else if selectedButtonIndex == 2{
            let vc = storyboard?.instantiateViewController(identifier: "DessertItemVC")
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        else if selectedButtonIndex == 3{
            let vc = storyboard?.instantiateViewController(identifier: "CakeItemVC")
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        else if selectedButtonIndex == 4{
            let vc = storyboard?.instantiateViewController(identifier: "snackItemVC")
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
}

extension RestaurantVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if selectedButtonIndex == 0 {
            return fooditems.count
        }
        else if selectedButtonIndex == 1 {
            return juiceitems.count
        }
        else if selectedButtonIndex == 2 {
            return deserrtitems.count
        }
        else if selectedButtonIndex == 3 {
            return cakeitems.count
        }
        else if selectedButtonIndex == 4 {
            return snackitems.count
        }
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodsCell", for: indexPath) as! FoodsCell
        
        if selectedButtonIndex == 0 {
            cell.foodImgVw.image = UIImage(named: self.fooditems[indexPath.item]["ItemImg"] as! String)
            cell.foodNameLbl.text = self.fooditems[indexPath.item]["ItemName"] as? String
            cell.priceLbl.text = self.fooditems[indexPath.item]["ItemPrice"] as? String
            cell.ratingLbl.text = self.fooditems[indexPath.item]["ItemRating"] as? String
            cell.timeLbl.text = self.fooditems[indexPath.item]["ItemTiming"] as? String
            
            cell.likeBtn.addTarget(self, action: #selector(likeBtnTapped(_:)), for: .touchUpInside)
        }
        else if selectedButtonIndex == 1{
            cell.foodImgVw.image = UIImage(named: self.juiceitems[indexPath.item]["ItemImg"] as! String)
            cell.foodNameLbl.text = self.juiceitems[indexPath.item]["ItemName"] as? String
            cell.priceLbl.text = self.juiceitems[indexPath.item]["ItemPrice"] as? String
            cell.ratingLbl.text = self.juiceitems[indexPath.item]["ItemRating"] as? String
            cell.timeLbl.text = self.juiceitems[indexPath.item]["ItemTiming"] as? String
        }
        else if selectedButtonIndex == 2 {
            cell.foodImgVw.image = UIImage(named: self.deserrtitems[indexPath.item]["ItemImg"] as! String)
            cell.foodNameLbl.text = self.deserrtitems[indexPath.item]["ItemName"] as? String
            cell.priceLbl.text = self.deserrtitems[indexPath.item]["ItemPrice"] as? String
            cell.ratingLbl.text = self.deserrtitems[indexPath.item]["ItemRating"] as? String
            cell.timeLbl.text = self.deserrtitems[indexPath.item]["ItemTiming"] as? String
        }
        else if selectedButtonIndex == 3{
            cell.foodImgVw.image = UIImage(named: self.cakeitems[indexPath.item]["ItemImg"] as! String)
            cell.foodNameLbl.text = self.cakeitems[indexPath.item]["ItemName"] as? String
            cell.priceLbl.text = self.cakeitems[indexPath.item]["ItemPrice"] as? String
            cell.ratingLbl.text = self.cakeitems[indexPath.item]["ItemRating"] as? String
            cell.timeLbl.text = self.cakeitems[indexPath.item]["ItemTiming"] as? String
        }
        else if selectedButtonIndex == 4{
            cell.foodImgVw.image = UIImage(named: self.snackitems[indexPath.item]["ItemImg"] as! String)
            cell.foodNameLbl.text = self.snackitems[indexPath.item]["ItemName"] as? String
            cell.priceLbl.text = self.snackitems[indexPath.item]["ItemPrice"] as? String
            cell.ratingLbl.text = self.snackitems[indexPath.item]["ItemRating"] as? String
            cell.timeLbl.text = self.snackitems[indexPath.item]["ItemTiming"] as? String
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: 340)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return sectionInsets.right
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return sectionInsets
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if selectedButtonIndex == 0{
            
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
        else if selectedButtonIndex == 1{
            
            self.PassFoodName = self.juiceitems[indexPath.item]["ItemName"] as! String
            self.PassFoodPrice = self.juiceitems[indexPath.item]["ItempassPrice"] as! Int
            self.PassFoodRating = self.juiceitems[indexPath.item]["ItemRating"] as! String
            self.PassFoodImg = UIImage(named: self.juiceitems[indexPath.item]["ItemImg"] as! String)!
                
            let desvc = storyboard?.instantiateViewController(identifier: "FoodVC") as! FoodOrderVC
            
            desvc.recieveFoodName = self.PassFoodName
            desvc.recieveFoodPrice = self.PassFoodPrice
            desvc.recieveFoodRating = self.PassFoodRating
            desvc.recieveFoodImg = self.PassFoodImg
            desvc.isTinted = self.isTinted

            self.navigationController?.pushViewController(desvc, animated: true)
            
        }
        else if selectedButtonIndex == 2{
            
            self.PassFoodName = self.deserrtitems[indexPath.item]["ItemName"] as! String
            self.PassFoodPrice = self.deserrtitems[indexPath.item]["ItempassPrice"] as! Int
            self.PassFoodRating = self.deserrtitems[indexPath.item]["ItemRating"] as! String
            self.PassFoodImg = UIImage(named: self.deserrtitems[indexPath.item]["ItemImg"] as! String)!
                
            let desvc = storyboard?.instantiateViewController(identifier: "FoodVC") as! FoodOrderVC
            
            desvc.recieveFoodName = self.PassFoodName
            desvc.recieveFoodPrice = self.PassFoodPrice
            desvc.recieveFoodRating = self.PassFoodRating
            desvc.recieveFoodImg = self.PassFoodImg
            desvc.isTinted = self.isTinted

            self.navigationController?.pushViewController(desvc, animated: true)
            
        }
        else if selectedButtonIndex == 3{
            
            self.PassFoodName = self.cakeitems[indexPath.item]["ItemName"] as! String
            self.PassFoodPrice = self.cakeitems[indexPath.item]["ItempassPrice"] as! Int
            self.PassFoodRating = self.cakeitems[indexPath.item]["ItemRating"] as! String
            self.PassFoodImg = UIImage(named: self.cakeitems[indexPath.item]["ItemImg"] as! String)!
                
            let desvc = storyboard?.instantiateViewController(identifier: "FoodVC") as! FoodOrderVC
            
            desvc.recieveFoodName = self.PassFoodName
            desvc.recieveFoodPrice = self.PassFoodPrice
            desvc.recieveFoodRating = self.PassFoodRating
            desvc.recieveFoodImg = self.PassFoodImg
            desvc.isTinted = self.isTinted

            self.navigationController?.pushViewController(desvc, animated: true)
            
        }
        else if selectedButtonIndex == 4{
            
            self.PassFoodName = self.snackitems[indexPath.item]["ItemName"] as! String
            self.PassFoodPrice = self.snackitems[indexPath.item]["ItempassPrice"] as! Int
            self.PassFoodRating = self.snackitems[indexPath.item]["ItemRating"] as! String
            self.PassFoodImg = UIImage(named: self.snackitems[indexPath.item]["ItemImg"] as! String)!
                
            let desvc = storyboard?.instantiateViewController(identifier: "FoodVC") as! FoodOrderVC
            
            desvc.recieveFoodName = self.PassFoodName
            desvc.recieveFoodPrice = self.PassFoodPrice
            desvc.recieveFoodRating = self.PassFoodRating
            desvc.recieveFoodImg = self.PassFoodImg
            desvc.isTinted = self.isTinted

            self.navigationController?.pushViewController(desvc, animated: true)
            
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
}

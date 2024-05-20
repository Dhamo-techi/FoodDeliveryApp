//
//  Home.swift
//  DeliveryApp
//
//  Created by MAC PRO on 22/01/24.
//

import UIKit
import CoreData

class Home: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var tView: UIView!
    
    @IBOutlet weak var ppView: UIView!
    
    @IBOutlet weak var menubarBtn: UIButton!
    
    @IBOutlet weak var profileImgVw: UIImageView!
    
    @IBOutlet weak var searchTxtFld: UITextField!
    
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBOutlet weak var homeBtn: UIButton!
    
    @IBOutlet weak var notifyBtn: UIButton!
    
    @IBOutlet weak var orderBtn: UIButton!
    
    @IBOutlet weak var favtBtn: UIButton!
    
    @IBOutlet weak var profileBtn: UIButton!
    
    @IBOutlet weak var ordBtn: UIButton!
    
    @IBOutlet weak var categoryCollectionVw: UICollectionView!
    
    @IBOutlet weak var PopularFoodsClcVw: UICollectionView!
    
    @IBOutlet weak var popularRestaurntTblVw: UITableView!
    
    var ctgcollections = [[String : String]]()
    
    var popularcollections = [[String : Any]]()
    
    var sidebarMenuView: SidebarMenuView!
    
    var issidebarviewEnable : Bool = false
    
    var popularRestaurant = [[String : String]]()
    
    var PassFoodImg = UIImage()
    var PassFoodPrice = Int()
    var PassFoodName = String()
    var PassFoodRating = String()
    
    var PassRstImg = UIImage()
    var PassRstName = String()
    var PassRstRating = String()
    var PassRstTiming = String()
    
    var selectedindex = 0
    
    var result = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.searchTxtFld.delegate = self
        
        self.ordBtn.layer.cornerRadius = 35.0
        
        self.menubarBtn.layer.cornerRadius = 10
        
        self.menubarBtn.layer.borderWidth = 2
        self.menubarBtn.layer.borderColor = UIColor.secondarySystemFill.cgColor
        
        self.profileImgVw.layer.cornerRadius = 10
        self.profileImgVw.image = UIImage(named: "profileLuffy")
        
        self.searchTxtFld.layer.cornerRadius = 15
        
        let searchpadding = UIView(frame: CGRect(x: 0, y: 30, width: 30, height: 60))
        self.searchTxtFld.leftView = searchpadding
        self.searchTxtFld.leftViewMode = .always
        
        self.searchBtn.layer.cornerRadius = 15
        
        self.navigationController?.isNavigationBarHidden = true
        
        homeBtn.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        notifyBtn.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        orderBtn.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        favtBtn.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        profileBtn.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        
        //data for category cell
        self.ctgcollections = [["name" : "Food", "image" : "foodCgt"],["name" : "Juice", "image" : "juice"],["name" : "Cake", "image" : "cake"],["name" : "Snacks", "image" : "snack"],["name" : "Desert", "image" : "desert"]]
        
        //data for popularfoods
        self.popularcollections = [["name" : "Dosa(Roast)","image" : "Dosa","price" : "Rs.80","PassFoodPrice" : 80,"rating" : "4.4", "time" : "30 mins"],["name" : "Idli(2 Pieces)","image" : "Idli","price" : "Rs.30","PassFoodPrice" : 30,"rating" : "5.0", "time" : "20 mins"],["name" : "Poori(2 Pieces)","image" : "poori","price" : "Rs.70","PassFoodPrice" : 70,"rating" : "4.5", "time" : "40 mins"],["name" : "Chapathi(2 Pieces)","image" : "chapati","price" : "Rs.60","PassFoodPrice" : 60,"rating" : "5.0", "time" : "30 mins"],["name" : "Meals","image" : "Rst2","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.4", "time" : "60 mins"],["name" : "Burger","image" : "Rst3","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"],["name" : "Pizza","image" : "Rst4","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"],["name" : "Dosa(Roast)","image" : "Dosa","price" : "Rs.80","PassFoodPrice" : 80,"rating" : "4.4", "time" : "30 mins"],["name" : "Idli(2 Pieces)","image" : "Idli","price" : "Rs.30","PassFoodPrice" : 30,"rating" : "5.0", "time" : "20 mins"],["name" : "Poori(2 Pieces)","image" : "poori","price" : "Rs.70","PassFoodPrice" : 70,"rating" : "4.5", "time" : "40 mins"],["name" : "Chapathi(2 Pieces)","image" : "chapati","price" : "Rs.60","PassFoodPrice" : 60,"rating" : "5.0", "time" : "30 mins"],["name" : "Meals","image" : "Rst2","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.4", "time" : "60 mins"],["name" : "Burger","image" : "Rst3","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"],["name" : "Pizza","image" : "Rst4","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"],["name" : "Dosa(Roast)","image" : "Dosa","price" : "Rs.80","PassFoodPrice" : 80,"rating" : "4.4", "time" : "30 mins"],["name" : "Idli(2 Pieces)","image" : "Idli","price" : "Rs.30","PassFoodPrice" : 30,"rating" : "5.0", "time" : "20 mins"],["name" : "Poori(2 Pieces)","image" : "poori","price" : "Rs.70","PassFoodPrice" : 70,"rating" : "4.5", "time" : "40 mins"],["name" : "Chapathi(2 Pieces)","image" : "chapati","price" : "Rs.60","PassFoodPrice" : 60,"rating" : "5.0", "time" : "30 mins"],["name" : "Meals","image" : "Rst2","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.4", "time" : "60 mins"],["name" : "Burger","image" : "Rst3","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"],["name" : "Pizza","image" : "Rst4","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"]]
        
        //data for popularRestaurant
        self.popularRestaurant = [["RstImg" : "Rst1","RstName" : "Saravana Bhavan", "RstRating" : "4.5", "RstTime" : "30-45 mins"],["RstImg" : "Rst2","RstName" : "Krishna Restaurant", "RstRating" : "4.9", "RstTime" : "20-30 mins"],["RstImg" : "Rst3","RstName" : "Oven Story", "RstRating" : "4.3", "RstTime" : "25-30 mins"],["RstImg" : "Rst4","RstName" : "Indiana Burgers", "RstRating" : "3.5", "RstTime" : "20-40 mins"],["RstImg" : "Rst5","RstName" : "HMR Biriyani Hut", "RstRating" : "4.6", "RstTime" : "25-50 mins"]]
        
        
        
        self.categoryCollectionVw.showsHorizontalScrollIndicator = false
        self.categoryCollectionVw.isUserInteractionEnabled = true
        self.categoryCollectionVw.allowsSelection = true
        self.PopularFoodsClcVw.showsHorizontalScrollIndicator = false
        self.popularRestaurntTblVw.showsHorizontalScrollIndicator = false
        self.popularRestaurntTblVw.showsHorizontalScrollIndicator = false
        
        
        self.categoryCollectionVw.backgroundColor = .clear
        self.PopularFoodsClcVw.backgroundColor = .clear
        self.popularRestaurntTblVw.backgroundColor = .clear
        self.ppView.backgroundColor = .clear
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        self.categoryCollectionVw.collectionViewLayout = flowlayout
        
        //CollectionViewCell
        self.PopularFoodsClcVw.register(UINib(nibName: "PopularFoodCell", bundle: nil), forCellWithReuseIdentifier: "PopularFoodCell")
        
        //TableviewcellCell
        self.popularRestaurntTblVw.register(UINib(nibName: "PopularRestaurntCell", bundle: nil), forCellReuseIdentifier: "PopularRestaurntCell")
        
        self.ordBtn.layer.shadowColor = UIColor(red: 0.39, green: 0.38, blue: 0.38, alpha: 1).cgColor
        self.ordBtn.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.ordBtn.layer.shadowRadius = 5
        self.ordBtn.layer.shadowOpacity = 1
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let vc = storyboard?.instantiateViewController(identifier: "SearchVC")
        self.navigationController?.pushViewController(vc!, animated: true )
        return false
    }
    
    
    @objc func tapButton(_ sender: UIButton) {
        
        homeBtn.tintColor = UIColor.darkGray
        notifyBtn.tintColor = UIColor.darkGray
        orderBtn.tintColor = UIColor.darkGray
        favtBtn.tintColor = UIColor.darkGray
        profileBtn.tintColor = UIColor.darkGray
        
        sender.tintColor = UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1)
    }
    
    @IBAction func menubarBtn(_ sender: Any) {
        
        if sidebarMenuView == nil {
            
            sidebarMenuView = SidebarMenuView(frame: CGRect(x: 0, y: 0, width: 350, height: view.bounds.height))
            sidebarMenuView.delegate = self
            view.bringSubviewToFront(sidebarMenuView)
            view.addSubview(sidebarMenuView)
        }
        
        UIView.animate(withDuration: 0.5) {
            self.sidebarMenuView.frame.origin.x = 0
        }
    }
    
    @objc func handleTapGesture(_ sender: UITapGestureRecognizer) {
        if let sidebarMenuView = sidebarMenuView,
           sidebarMenuView.frame.origin.x == 0 {
            UIView.animate(withDuration: 0.5) {
                sidebarMenuView.frame.origin.x = -sidebarMenuView.frame.width
            }
        }
    }
    
    @IBAction func searchBtn(_ sender: Any) {
    }
    
    @IBAction func ordBtnTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "OrderVC") as! OrderVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func viewAllBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "PopularFoodsVC")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func NRviewallBtnTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "NearbyRestaurant")
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
}

extension Home: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionVw{
            return self.ctgcollections.count
        } else if collectionView == PopularFoodsClcVw {
            return 5
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.categoryCollectionVw{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else{
                return UICollectionViewCell()
            }
            cell.CnameLbl.text = self.ctgcollections[indexPath.item]["name"]
            cell.CimgvW.image = UIImage(named: self.ctgcollections[indexPath.item]["image"] ?? "")
            
            return cell
            
        }
        else if collectionView == self.PopularFoodsClcVw {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularFoodCell", for: indexPath) as? PopularFoodCell else{
                return UICollectionViewCell()
            }
            cell.foodNameLbl.text = self.popularcollections[indexPath.item]["name"] as? String
            cell.foodImgvw.image = UIImage(named: self.popularcollections[indexPath.item]["image"] as! String)
            cell.foodPriceLb.text = self.popularcollections[indexPath.item]["price"] as? String
            cell.foodtimeLbl.text = self.popularcollections[indexPath.item]["time"] as? String
            cell.ratingLbl.text = self.popularcollections[indexPath.item]["rating"] as? String
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == PopularFoodsClcVw{
            
            self.PassFoodName = self.popularcollections[indexPath.item]["name"] as! String
            self.PassFoodPrice = self.popularcollections[indexPath.item]["PassFoodPrice"] as! Int
            self.PassFoodRating = self.popularcollections[indexPath.item]["rating"] as! String
            self.PassFoodImg = UIImage(named: self.popularcollections[indexPath.item]["image"] as! String)!
            
            let desvc = storyboard?.instantiateViewController(identifier: "FoodVC") as! FoodOrderVC
            
            desvc.recieveFoodName = self.PassFoodName
            desvc.recieveFoodPrice = self.PassFoodPrice
            desvc.recieveFoodRating = self.PassFoodRating
            desvc.recieveFoodImg = self.PassFoodImg
            
            self.navigationController?.pushViewController(desvc, animated: true)
        }
        else if collectionView == categoryCollectionVw{
            switch indexPath.item {
            case 0:
                navigateToFoodVC()
            case 1:
                navigateToJuiceVC()
            case 2:
                navigateToCakeVC()
            case 3:
                navigateToSnacksVC()
            case 4:
                navigateToDessertVC()
            default:
                break
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionVw{
            let width =  140.0 / 1.0 - 10.0
            let height = 60.0
            return CGSize(width: width, height: height)
        }
        else if collectionView == PopularFoodsClcVw{
            let width = (310 - 1 * 10) / 1.0
            let height = 310.0
            return CGSize(width: width, height: height)
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == categoryCollectionVw{
            return 40.0
        }else if collectionView == PopularFoodsClcVw{
            return 30.0
        }
        return CGFloat()
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == PopularFoodsClcVw{
            return 1.0
        }
        return CGFloat()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == PopularFoodsClcVw{
            return UIEdgeInsets(top: 10.0, left:20.0, bottom: 10.0, right: 10.0)
        } else if collectionView == categoryCollectionVw{
            return UIEdgeInsets(top: 10.0, left:20.0, bottom: 10.0, right: 10.0)
        }
        return UIEdgeInsets()
    }
    
    func navigateToFoodVC() {
        if let foodVC = storyboard?.instantiateViewController(withIdentifier: "FoodItemVC") as? FoodItemVC {
            navigationController?.pushViewController(foodVC, animated: true)
        }
    }
    
    func navigateToJuiceVC() {
        if let juiceVC = storyboard?.instantiateViewController(withIdentifier: "JuiceItemVC") as? JuiceItemVC {
            navigationController?.pushViewController(juiceVC, animated: true)
        }
    }
    
    func navigateToDessertVC() {
        if let Vc = storyboard?.instantiateViewController(withIdentifier: "DessertItemVC") as? DessertItemVC {
            navigationController?.pushViewController(Vc, animated: true)
        }
    }
    
    func navigateToCakeVC() {
        if let DessertVC = storyboard?.instantiateViewController(withIdentifier: "CakeItemVC") as? CakeItemVC {
            navigationController?.pushViewController(DessertVC, animated: true)
        }
    }
    
    func navigateToSnacksVC() {
        if let SnacksVC = storyboard?.instantiateViewController(withIdentifier: "snackItemVC") as? snackItemVC {
            navigationController?.pushViewController(SnacksVC, animated: true)
        }
    }
}



extension Home: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.popularRestaurant.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopularRestaurntCell") as! PopularRestaurntCell
        cell.restaurntNameLbl.text = self.popularRestaurant[indexPath.row]["RstName"]
        cell.reataurantFoodImgVw.image = UIImage(named: self.popularRestaurant[indexPath.row]["RstImg"] ?? "")
        cell.RestaurntPrepareTimeLbl.text = self.popularRestaurant[indexPath.row]["RstTime"]
        cell.restaurantRatingLbl.text = self.popularRestaurant[indexPath.row]["RstRating"]
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.PassRstName = self.popularRestaurant[indexPath.row]["RstName"]!
        self.PassRstRating = self.popularRestaurant[indexPath.row]["RstRating"]!
        self.PassRstTiming = self.popularRestaurant[indexPath.row]["RstTime"]!
        self.PassRstImg = UIImage(named: self.popularRestaurant[indexPath.row]["RstImg"]!)!
        
        let desvc = storyboard?.instantiateViewController(identifier: "RestaurantVC") as! RestaurantVC
        
        desvc.recieveRstName = self.PassRstName
        desvc.recieveRstRating = self.PassRstRating
        desvc.recieveRstTiming = self.PassRstTiming
        desvc.recieveRstImg = self.PassRstImg
        
        self.navigationController?.pushViewController(desvc, animated: true)
    }
    
    
}

extension Home: SidebarMenuViewDelegate {
    
    func sidebarMenuDidCancel() {
        UIView.animate(withDuration: 0.5) {
            self.sidebarMenuView.frame.origin.x = -self.sidebarMenuView.frame.width
        }
    }

    
    func sidebarMenuDidSelect(itemName: String) {
        
        closeSidebarMenu()
        
        switch itemName {
        case "Profile":
            let vc = storyboard?.instantiateViewController(identifier: "ProfileVC") as! ProfileVC
            self.navigationController?.pushViewController(vc, animated: true)
            
        case "Categories":
            let vc = storyboard?.instantiateViewController(identifier: "CategoriesVc")
            self.navigationController?.pushViewController(vc!, animated: true)
        case "Cart":
            let vc = storyboard?.instantiateViewController(identifier: "OrderVC") as! OrderVC
            self.navigationController?.pushViewController(vc, animated: true)
        case "Payment Card": break

        case "Push-Notifications": break

        case "Logout":
            let vc = storyboard?.instantiateViewController(identifier: "LoginPage") as! LoginPage
            self.navigationController?.pushViewController(vc, animated: false)
        default:
            break
        }
    }
    
    private func closeSidebarMenu() {
        UIView.animate(withDuration: 0.5) {
            self.sidebarMenuView?.frame.origin.x = -(self.sidebarMenuView?.frame.width)!
        }
    }
}

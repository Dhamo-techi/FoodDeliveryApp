//
//  ProfileVC.swift
//  DeliveryApp
//
//  Created by MAC PRO on 24/02/24.
//

import UIKit
import CoreData

class ProfileVC: UIViewController {
    
    
    @IBOutlet weak var orderBtn: UIButton!
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var profileImgVw: UIImageView!
    
    @IBOutlet weak var userNameLbl: UILabel!
    
    @IBOutlet weak var addressLbl: UILabel!
    
    @IBOutlet weak var EditProfileBtn: UIButton!
    
    @IBOutlet weak var favtFoodBtn: UIButton!
    
    @IBOutlet weak var settingBtn: UIButton!
    
    @IBOutlet weak var favtView: UIView!
    
    @IBOutlet weak var favtCollectionView: UICollectionView!
    
    @IBOutlet weak var settingsView: UIView!
    
    @IBOutlet weak var SettingTableView: UITableView!
    
    var selectedButtonIndex = 0
    
    var result = [Any]()
    
    var passfinal = NSManagedObject()
    
    var favtfoods = [[String : Any]]()
    
    let itemsPerRow: CGFloat = 2
    let sectionInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    var settingData = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
        
        
        self.backBtn.layer.borderWidth = 2.0
        self.backBtn.layer.borderColor = UIColor.secondarySystemFill.cgColor
        
        self.profileImgVw.layer.cornerRadius = 35.0
        
        self.orderBtn.layer.cornerRadius = 35.0
        
        self.orderBtn.layer.shadowColor = UIColor(red: 0.39, green: 0.38, blue: 0.38, alpha: 1).cgColor
        self.orderBtn.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.orderBtn.layer.shadowRadius = 5
        self.orderBtn.layer.shadowOpacity = 1
        
        self.favtFoodBtn.layer.cornerRadius = 30
        self.settingBtn.layer.cornerRadius = 30
        
        self.backBtn.layer.cornerRadius = 15
        
        if self.tabBarController != nil {
            orderBtn.isHidden = false
        } else {
            orderBtn.isHidden = true
            self.backBtn.addTarget(self, action: #selector(backBtnTapped(_:)), for: .touchUpInside)
        }
        
        favtFoodBtn.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        settingBtn.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        
        self.favtfoods = [["name" : "Dosa(Roast)","image" : "Dosa","price" : "Rs.80","PassFoodPrice" : 80,"rating" : "4.4", "time" : "30 mins"],["name" : "Idli(2 Pieces)","image" : "Idli","price" : "Rs.30","PassFoodPrice" : 30,"rating" : "5.0", "time" : "20 mins"],["name" : "Poori(2 Pieces)","image" : "poori","price" : "Rs.70","PassFoodPrice" : 70,"rating" : "4.5", "time" : "40 mins"],["name" : "Chapathi(2 Pieces)","image" : "chapati","price" : "Rs.60","PassFoodPrice" : 60,"rating" : "5.0", "time" : "30 mins"],["name" : "Meals","image" : "Rst2","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.4", "time" : "60 mins"],["name" : "Burger","image" : "Rst3","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"],["name" : "Pizza","image" : "Rst4","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"],["name" : "Dosa(Roast)","image" : "Dosa","price" : "Rs.80","PassFoodPrice" : 80,"rating" : "4.4", "time" : "30 mins"]]
        
        self.favtCollectionView.register(UINib(nibName: "PopularFoodsViewAllCell", bundle: nil), forCellWithReuseIdentifier: "PopularFoodsViewAllCell")
        
        favtCollectionView.backgroundColor = .none
        favtCollectionView.showsVerticalScrollIndicator = false
        
        let layout = CustomVerticalFlowLayout()
        favtCollectionView.collectionViewLayout = layout
        favtCollectionView.dataSource = self
        
        
        self.settingData = [["text" : "Profile","image" : "profileP"],["text" : "Categories","image" : "categories"],["text" : "Payment Method","image" : "card"],["text" : "Filter","image" : "filter"],["text" : "Help","image" : "help"]]
        
        
        self.SettingTableView.register(UINib(nibName: "SettingTableCell", bundle: nil), forCellReuseIdentifier: "SettingTableCell")
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.fetchdata()
    }
    
    
    func fetchdata(){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName:"UserProfileData")
        
        do {
            self.result = try context.fetch(fetchrequest)
            updateUIWithFetchedData()
        } catch let err as NSError {
            print(err.localizedDescription)
        }
    }
    
    func updateUIWithFetchedData() {
        if let userProfileData = result.first as? UserProfileData {
            // Assuming attribute names
            userNameLbl.text = userProfileData.userName
            addressLbl.text = userProfileData.userAddress
            
        } else {
            
            self.addressLbl.text = "Add your Address by clicking EditProfile Button"
            
        }
    }
    
    @objc func tapButton(_ sender: UIButton) {
        
        if sender == favtFoodBtn {
            favtFoodBtn.backgroundColor = UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1)
            favtFoodBtn.setTitleColor(.white, for: .normal)
            
            settingBtn.backgroundColor = .white
            settingBtn.setTitleColor(.black, for: .normal)
            
            self.settingsView.isHidden = true
            self.favtView.isHidden = false
            
        } else if sender == settingBtn {
            favtFoodBtn.backgroundColor = .white
            favtFoodBtn.setTitleColor(.black, for: .normal)
            
            settingBtn.backgroundColor = UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1)
            settingBtn.setTitleColor(.white, for: .normal)
            
            self.favtView.isHidden = true
            self.settingsView.isHidden = false
            
            
        }
    }
    
    @objc func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            // Perform pop action to go back
            self.navigationController?.popViewController(animated: false)
        }
    }
    
    @IBAction func orderBtnTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "OrderVC") as! OrderVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func backBtnTapped(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func EditProfileBtnTapped(_ sender: Any) {
        
        self.passfinal = self.result.first as! UserProfileData
        
        let desvc = storyboard?.instantiateViewController(identifier: "EditProfileVc") as! EditProfileVc
        
        desvc.recieveValue = self.passfinal
        
        self.navigationController?.pushViewController(desvc, animated: true)
        
        
    }
    
    
    @IBAction func favtFoodBtnTapped(_ sender: Any) {
    }
    
    @IBAction func settingBtnTapped(_ sender: Any) {
    }
    
}

extension ProfileVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favtfoods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularFoodsViewAllCell", for: indexPath) as! PopularFoodsViewAllCell
        cell.foodNameLbl.text = self.favtfoods[indexPath.item]["name"] as? String
        cell.foodImgvw.image = UIImage(named: self.favtfoods[indexPath.item]["image"] as! String)
        cell.foodPriceLb.text = self.favtfoods[indexPath.item]["price"] as? String
        cell.foodtimeLbl.text = self.favtfoods[indexPath.item]["time"] as? String
        cell.ratingLbl.text = self.favtfoods[indexPath.item]["rating"] as? String
        
        cell.savedBtn.tintColor = UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: 260)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.right
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    }
    
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableCell") as! SettingTableCell
        
        cell.settingLogo.image = UIImage(named: self.settingData[indexPath.row]["image"] as! String)
        cell.settingNameLbl.text = self.settingData[indexPath.row]["text"] as? String
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    
    
    
}



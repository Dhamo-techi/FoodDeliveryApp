//
//  PopularFoodsVC.swift
//  DeliveryApp
//
//  Created by MAC PRO on 06/02/24.
//

import UIKit

class PopularFoodsVC: UIViewController, UICollectionViewDelegateFlowLayout {
    
    var isTinted = false

    var popularcollections = [[String : Any]]()
    
    let itemsPerRow: CGFloat = 2
    let sectionInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    var PassFoodImg = UIImage()
    var PassFoodPrice = Int()
    var PassFoodName = String()
    var PassFoodRating = String()
    
    @IBOutlet weak var BackBtn: UIButton!
    
    @IBOutlet weak var popularFoodLbl: UILabel!
    
    @IBOutlet weak var searchBtn: UIButton!
    
    
    @IBOutlet weak var notificationBtn: UIButton!
    
    
    @IBOutlet weak var PopularCollectionsVw: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
        BackGesture.addBackGesture(to: self, action: #selector(handleSwipeGesture))
        
        self.BackBtn.layer.borderWidth = 2.0
        self.BackBtn.layer.borderColor = UIColor.secondarySystemFill.cgColor
        self.BackBtn.backgroundColor = .none
        
        self.PopularCollectionsVw.showsVerticalScrollIndicator = false
        
        self.PopularCollectionsVw.register(UINib(nibName: "PopularFoodsViewAllCell", bundle: nil), forCellWithReuseIdentifier: "PopularFoodsViewAllCell")
        
        self.popularcollections = [["name" : "Dosa(Roast)","image" : "Dosa","price" : "Rs.80","PassFoodPrice" : 80,"rating" : "4.4", "time" : "30 mins"],["name" : "Idli(2 Pieces)","image" : "Idli","price" : "Rs.30","PassFoodPrice" : 30,"rating" : "5.0", "time" : "20 mins"],["name" : "Poori(2 Pieces)","image" : "poori","price" : "Rs.70","PassFoodPrice" : 70,"rating" : "4.5", "time" : "40 mins"],["name" : "Chapathi(2 Pieces)","image" : "chapati","price" : "Rs.60","PassFoodPrice" : 60,"rating" : "5.0", "time" : "30 mins"],["name" : "Meals","image" : "Rst2","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.4", "time" : "60 mins"],["name" : "Burger","image" : "Rst3","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"],["name" : "Pizza","image" : "Rst4","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"],["name" : "Dosa(Roast)","image" : "Dosa","price" : "Rs.80","PassFoodPrice" : 80,"rating" : "4.4", "time" : "30 mins"],["name" : "Idli(2 Pieces)","image" : "Idli","price" : "Rs.30","PassFoodPrice" : 30,"rating" : "5.0", "time" : "20 mins"],["name" : "Poori(2 Pieces)","image" : "poori","price" : "Rs.70","PassFoodPrice" : 70,"rating" : "4.5", "time" : "40 mins"],["name" : "Chapathi(2 Pieces)","image" : "chapati","price" : "Rs.60","PassFoodPrice" : 60,"rating" : "5.0", "time" : "30 mins"],["name" : "Meals","image" : "Rst2","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.4", "time" : "60 mins"],["name" : "Burger","image" : "Rst3","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"],["name" : "Pizza","image" : "Rst4","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"],["name" : "Dosa(Roast)","image" : "Dosa","price" : "Rs.80","PassFoodPrice" : 80,"rating" : "4.4", "time" : "30 mins"],["name" : "Idli(2 Pieces)","image" : "Idli","price" : "Rs.30","PassFoodPrice" : 30,"rating" : "5.0", "time" : "20 mins"],["name" : "Poori(2 Pieces)","image" : "poori","price" : "Rs.70","PassFoodPrice" : 70,"rating" : "4.5", "time" : "40 mins"],["name" : "Chapathi(2 Pieces)","image" : "chapati","price" : "Rs.60","PassFoodPrice" : 60,"rating" : "5.0", "time" : "30 mins"],["name" : "Meals","image" : "Rst2","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.4", "time" : "60 mins"],["name" : "Burger","image" : "Rst3","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"],["name" : "Pizza","image" : "Rst4","price" : "Rs.150","PassFoodPrice" : 150,"rating" : "4.8", "time" : "50 mins"]]
        
        let layout = CustomVerticalFlowLayout()
        PopularCollectionsVw.collectionViewLayout = layout
        PopularCollectionsVw.dataSource = self
        
        self.BackBtn.layer.borderWidth = 2.0
        self.BackBtn.layer.borderColor = UIColor.secondarySystemFill.cgColor
        
        self.BackBtn.layer.cornerRadius = 15
        
        let headerNib = UINib(nibName: "HeaderView", bundle: nil)
        
        PopularCollectionsVw.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")
        
        
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
    
    @IBAction func notificationBtnTapped(_ sender: Any) {
    }
    
    @objc func saveBtn(_ sender: UIButton) {
        
        let indexPath = IndexPath(item: sender.tag, section: 0) // Assuming the button tag is set to indexPath.row
            let selectedItem = popularcollections[indexPath.item]
            // Save the selected item to UserDefaults or any other data store
            // Example:
            var savedItems = UserDefaults.standard.array(forKey: "SavedItems") as? [[String: Any]] ?? []
            savedItems.append(selectedItem)
            UserDefaults.standard.set(savedItems, forKey: "SavedItems")
            // Update UI to indicate that the item is saved
        
        if isTinted {
            sender.tintColor = UIColor.lightGray
        } else {
            sender.tintColor = UIColor(red: 250/255.0, green: 106/255.0, blue: 16/255.0, alpha: 1)
        }
        isTinted.toggle()
    }
}


extension PopularFoodsVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularcollections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularFoodsViewAllCell", for: indexPath) as! PopularFoodsViewAllCell
        cell.foodNameLbl.text = self.popularcollections[indexPath.item]["name"] as? String
        cell.foodImgvw.image = UIImage(named: self.popularcollections[indexPath.item]["image"] as! String)
        cell.foodPriceLb.text = self.popularcollections[indexPath.item]["price"] as? String
        cell.foodtimeLbl.text = self.popularcollections[indexPath.item]["time"] as? String
        cell.ratingLbl.text = self.popularcollections[indexPath.item]["rating"] as? String
        
        cell.savedBtn.tag = indexPath.item
        cell.savedBtn.addTarget(self, action: #selector(saveBtn(_:)), for: .touchUpInside)
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
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
            headerView.popularFoodLbl.text = "Popular Food Items"
            return headerView
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // Return the size of your header view
        return CGSize(width: collectionView.frame.width, height: 130) // Adjust the height as needed
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.PassFoodName = self.popularcollections[indexPath.item]["name"] as! String
        self.PassFoodPrice = self.popularcollections[indexPath.item]["PassFoodPrice"] as! Int
        self.PassFoodRating = self.popularcollections[indexPath.item]["rating"] as! String
        self.PassFoodImg = UIImage(named: self.popularcollections[indexPath.item]["image"] as! String)!
            
        let desvc = storyboard?.instantiateViewController(identifier: "FoodVC") as! FoodOrderVC
        
        desvc.recieveFoodName = self.PassFoodName
        desvc.recieveFoodPrice = self.PassFoodPrice
        desvc.recieveFoodRating = self.PassFoodRating
        desvc.recieveFoodImg = self.PassFoodImg
        desvc.isTinted = self.isTinted

        self.navigationController?.pushViewController(desvc, animated: true)
    }
    
    
}

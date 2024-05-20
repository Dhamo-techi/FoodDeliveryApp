//
//  FavouriteVC.swift
//  DeliveryApp
//
//  Created by MAC PRO on 24/02/24.
//

import UIKit

class FavouriteVC: UIViewController {

    var savedItems: [[String: Any]] = []
    
    let itemsPerRow: CGFloat = 2
    let sectionInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    @IBOutlet weak var orderBtn: UIButton!
    
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var NotificationBtn: UIButton!
    
    @IBOutlet weak var FavtRecieveCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
        
        self.orderBtn.layer.cornerRadius = 35.0
        
        self.orderBtn.layer.shadowColor = UIColor(red: 0.39, green: 0.38, blue: 0.38, alpha: 1).cgColor
        self.orderBtn.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.orderBtn.layer.shadowRadius = 5
        self.orderBtn.layer.shadowOpacity = 1
        
        self.backBtn.layer.cornerRadius = 15

        self.backBtn.layer.borderWidth = 2.0
        self.backBtn.layer.borderColor = UIColor.secondarySystemFill.cgColor
        
        if self.tabBarController != nil {
                    // If it is, show the button
                    orderBtn.isHidden = false
                } else {
                    // If it's not, hide the button
                    orderBtn.isHidden = true
                }
        
        self.FavtRecieveCollectionView.backgroundColor = .none
        self.savedItems = UserDefaults.standard.array(forKey: "SavedItems") as? [[String: Any]] ?? []
        self.FavtRecieveCollectionView.reloadData()
        self.FavtRecieveCollectionView.showsVerticalScrollIndicator = false
        
        self.FavtRecieveCollectionView.register(UINib(nibName: "PopularFoodsViewAllCell", bundle: nil), forCellWithReuseIdentifier: "PopularFoodsViewAllCell")

    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
    }
    
    @IBAction func searchBtnTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "SearchVC")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func notifyBtnTapped(_ sender: Any) {
    }
    
    @IBAction func orderBtnTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "OrderVC") as! OrderVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension FavouriteVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularFoodsViewAllCell", for: indexPath) as! PopularFoodsViewAllCell
        cell.foodNameLbl.text = savedItems[indexPath.item]["name"] as? String
        cell.foodImgvw.image = UIImage(named: self.savedItems[indexPath.item]["image"] as! String)
        cell.foodPriceLb.text = self.savedItems[indexPath.item]["price"] as? String
        cell.foodtimeLbl.text = self.savedItems[indexPath.item]["time"] as? String
        cell.ratingLbl.text = self.savedItems[indexPath.item]["rating"] as? String
        
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
}

//
//  OrderVC.swift
//  DeliveryApp
//
//  Created by MAC PRO on 24/02/24.
//

import UIKit

class OrderVC: UIViewController {

    
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var NotificationBtn: UIButton!
    
    @IBOutlet weak var checkoutView: UIView!
    
    @IBOutlet weak var selectitemsLbl: UILabel!
    
    @IBOutlet weak var totalAmtLbl: UILabel!
    
    @IBOutlet weak var checkoutBtn: UIButton!
    
    @IBOutlet weak var cartCollectionsClcVw: UICollectionView!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
        
        BackGesture.addBackGesture(to: self, action: #selector(handleSwipeGesture))
        
        self.checkoutBtn.layer.cornerRadius = 30.0
        self.checkoutView.layer.cornerRadius = 20.0
        self.backBtn.layer.borderWidth = 2.0
        self.backBtn.layer.borderColor = UIColor.secondarySystemFill.cgColor
        
        self.backBtn.layer.cornerRadius = 15
        
        self.cartCollectionsClcVw.register(UINib(nibName: "CartsCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CartsCollectionCell")
        
        self.cartCollectionsClcVw.backgroundColor = .none
        
        let layout = CustomVerticalFlowLayout()
        cartCollectionsClcVw.collectionViewLayout = layout
        cartCollectionsClcVw.dataSource = self
        
        
        self.selectitemsLbl.text = "\(10) Selected Food Items"
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
    
    @IBAction func checkoutBtnTapped(_ sender: Any) {
        let vc =  storyboard?.instantiateViewController(withIdentifier: "PaymentMethodVC") as! PaymentMethodVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
extension OrderVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartsCollectionCell", for: indexPath) as! CartsCollectionCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = CGFloat(390 - 1 * 10) / 1.0
        let height = CGFloat(140.0)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    }
}

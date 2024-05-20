//
//  PaymentMethodVC.swift
//  DeliveryApp
//
//  Created by MAC PRO on 28/03/24.
//

import UIKit

class PaymentMethodVC: UIViewController {
    
    @IBOutlet weak var itemTitleLbl: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var addressClcVw: UICollectionView!
    
    @IBOutlet weak var GpayBtn: UIButton!
    
    @IBOutlet weak var phonepeBtn: UIButton!
    
    @IBOutlet weak var paytmBtn: UIButton!
    
    @IBOutlet weak var codBtn: UIButton!
    
    @IBOutlet weak var checkoutView: UIView!
    
    @IBOutlet weak var checkoutBtn: UIButton!
    
    @IBOutlet weak var deliverychargePriceLbl: UILabel!
    
    @IBOutlet weak var subtotlPriceLbl: UILabel!
    
    @IBOutlet weak var totalPriceLbl: UILabel!
    
    @IBOutlet weak var paymentmethodTblVw: UITableView!
    
    var houseBalance = 0
    
    var addressBalance = 0
    
    var selectedButton: UIButton?
    
    var addressSelectedBtn: UIButton?
    
    var data: [AddressData] = []
    
    var paymentmethod = [[String : String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
        BackGesture.addBackGesture(to: self, action: #selector(handleSwipeGesture))
        
        self.backBtn.layer.borderWidth = 2.0
        self.backBtn.layer.borderColor = UIColor.secondarySystemFill.cgColor
        self.backBtn.layer.cornerRadius = 15
        
        self.checkoutBtn.layer.cornerRadius = 30
        
        self.checkoutView.isHidden = true
        self.checkoutView.layer.cornerRadius = 35
        checkoutView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        self.addressClcVw.delegate = self
        self.addressClcVw.dataSource = self
        
        self.addressClcVw.backgroundColor = .none
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        self.addressClcVw.collectionViewLayout = flowlayout
        
        self.addressClcVw.register(UINib(nibName: "AddYourAddressCell", bundle: nil), forCellWithReuseIdentifier: "AddYourAddressCell")
        
        self.addressClcVw.register(UINib(nibName: "AddressCell", bundle: nil), forCellWithReuseIdentifier: "AddressCell")
        
        self.addressClcVw.showsHorizontalScrollIndicator = false
        
        self.paymentmethodTblVw.register(UINib(nibName: "PaymentType", bundle: nil), forCellReuseIdentifier: "PaymentType")
        
        self.paymentmethodTblVw.separatorColor = .none
        self.paymentmethodTblVw.separatorStyle = .none
        
        self.paymentmethod = [["Logo" : "Gpay" , "ApplicationName" : "G-pay"],["Logo" : "phonepe" , "ApplicationName" : "PhonePe"],["Logo" : "paytm" , "ApplicationName" : "Paytm"],["Logo" : "COD" , "ApplicationName" : "Cash On Delivery"]]
        
        
    }
    
    @objc func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            // Perform pop action to go back
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    @IBAction func checkoutBtn(_ sender: Any) {
        if data.isEmpty {
                let alert = UIAlertController(title: "Add your Address", message: "Please add an address before checking out.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                
            }
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func GpayBtnTapped(_ sender: Any) {
        
    }
    
    @IBAction func PhonepeBtnTapped(_ sender: Any) {
    }
    
    
    @IBAction func paytmBtnTapped(_ sender: Any) {
    }
    
    
    @IBAction func codBtnTapped(_ sender: Any) {
    }
    
}

extension PaymentMethodVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return data.count
        }else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddressCell", for: indexPath) as! AddressCell
            let model = data[indexPath.item]
            cell.TitleLbl.text = model.TitleTxt
            cell.MblNumberLbl.text = model.MblNumTxt
            cell.addressLbl.text = model.AddressTxt
            cell.selectionBtn.tag = indexPath.row 
            cell.selectionBtn.addTarget(self, action: #selector(AddressbuttonTapped(_:)), for: .touchUpInside)
            
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddYourAddressCell", for: indexPath) as! AddYourAddressCell
            
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let width = (300 - 1 * 10) / 1.0
            let height = 160.0
            return CGSize(width: width, height: height)
        }else{
            let width = (300 - 1 * 10) / 1.0
            let height = 160.0
            return CGSize(width: width, height: height)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 20.0, bottom: 0, right: 20.0)
        }else{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20.0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            
        }else{
            let desvc = storyboard?.instantiateViewController(identifier: "AddAddressVC") as! AddAddressVC
            desvc.delegate = self
            self.navigationController?.pushViewController(desvc, animated: true)
        }
    }
    
    @objc func AddressbuttonTapped(_ sender: UIButton) {
        selectedButton?.setImage(UIImage(systemName: "circle"), for: .normal)
        sender.setImage(UIImage(systemName: "circle.circle.fill"), for: .normal)
        addressSelectedBtn = sender
        addressBalance += 1
    }
}

extension PaymentMethodVC : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentType", for: indexPath) as! PaymentType
        
        cell.paymentLogoImgvw.image = UIImage(named: self.paymentmethod[indexPath.row]["Logo"] ?? "")
        cell.paymentNameLbl.text = self.paymentmethod[indexPath.row]["ApplicationName"]
        cell.selectionBtn.tag = indexPath.row // Set tag to identify which button is tapped
        cell.selectionBtn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        selectedButton?.setImage(UIImage(systemName: "circle"), for: .normal)
        sender.setImage(UIImage(systemName: "circle.circle.fill"), for: .normal)
        selectedButton = sender
        checkoutView.isHidden = false
        houseBalance += 1
    }
    
}

extension PaymentMethodVC: UpdateDataDelegate {
    func updateData(withData data: [AddressData]) {
        self.data.append(contentsOf: data)
        addressClcVw.reloadData()
    }
}

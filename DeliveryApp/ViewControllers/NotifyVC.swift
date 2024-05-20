//
//  NotifyVC.swift
//  DeliveryApp
//
//  Created by MAC PRO on 24/02/24.
//

import UIKit

class NotifyVC: UIViewController {

    var notificationMessage: String?
    
    var subnotificationMessage: String?
    
    @IBOutlet weak var orderBtn: UIButton!
    
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var NotificationBtn: UIButton!
    
    @IBOutlet weak var notificationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
        notificationTableView.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: "NotificationCell")
        
        notificationTableView.backgroundColor = .none
        notificationTableView.separatorStyle = .none

    }
    
    func didLoginSuccessfully(message: String,submessage: String) {
            notificationMessage = message
        subnotificationMessage = submessage
            notificationTableView.reloadData()
        }
    
    @IBAction func orderBtnTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "OrderVC") as! OrderVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
//        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchBtnTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "SearchVC")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func notificationBtnTapped(_ sender: Any) {
    }
    
    
    
}


extension NotifyVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell") as! NotificationCell
        
        cell.DoneLbl.text = notificationMessage ?? "Registration Successful"
        cell.aboutLbl.text = subnotificationMessage ?? "You've Successfully Registred in foodXa now you can order and enjoy your meal"

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}

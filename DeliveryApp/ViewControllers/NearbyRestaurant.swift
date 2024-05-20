//
//  NearbyRestaurant.swift
//  DeliveryApp
//
//  Created by MAC PRO on 12/02/24.
//

import UIKit

class NearbyRestaurant: UIViewController {

    var popularRestaurant = [[String : String]]()
    
    @IBOutlet weak var NRTableview: UITableView!
    
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var NotificationBtn: UIButton!
    
    var PassRstImg = UIImage()
    var PassRstName = String()
    var PassRstRating = String()
    var PassRstTiming = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
        
        self.NRTableview.showsVerticalScrollIndicator = false
        self.NRTableview.showsHorizontalScrollIndicator = false
        
        self.backBtn.layer.borderWidth = 2.0
        self.backBtn.layer.borderColor = UIColor.secondarySystemFill.cgColor
        
        self.backBtn.layer.cornerRadius = 15
        
        BackGesture.addBackGesture(to: self, action: #selector(handleSwipeGesture))
        
        self.NRTableview.register(UINib(nibName: "PopularRestaurntCell", bundle: nil), forCellReuseIdentifier: "PopularRestaurntCell")
        
        self.popularRestaurant = [["RstImg" : "Rst1","RstName" : "Saravana Bhavan", "RstRating" : "4.5", "RstTime" : "30-45 mins"],["RstImg" : "Rst2","RstName" : "Krishna Restaurant", "RstRating" : "4.9", "RstTime" : "20-30 mins"],["RstImg" : "Rst3","RstName" : "Oven Story", "RstRating" : "4.3", "RstTime" : "25-30 mins"],["RstImg" : "Rst4","RstName" : "Indiana Burgers", "RstRating" : "3.5", "RstTime" : "20-40 mins"],["RstImg" : "Rst5","RstName" : "HMR Biriyani Hut", "RstRating" : "4.6", "RstTime" : "25-50 mins"],["RstImg" : "Rst6","RstName" : "Mcdonald's", "RstRating" : "4.7", "RstTime" : "25-50 mins"],["RstImg" : "Rst7","RstName" : "Kharadi Restaurants", "RstRating" : "4.2", "RstTime" : "25-30 mins"],["RstImg" : "Rst8","RstName" : "Cock Ra Co", "RstRating" : "4.5", "RstTime" : "25-40 mins"],["RstImg" : "Rst9","RstName" : "Dosa Kadai", "RstRating" : "4.9", "RstTime" : "25-30 mins"],["RstImg" : "Rst10","RstName" : "Samosa Point", "RstRating" : "4.7", "RstTime" : "25-50 mins"],["RstImg" : "Rst1","RstName" : "Saravana Bhavan", "RstRating" : "4.5", "RstTime" : "30-45 mins"],["RstImg" : "Rst2","RstName" : "Krishna Restaurant", "RstRating" : "4.9", "RstTime" : "20-30 mins"],["RstImg" : "Rst3","RstName" : "Oven Story", "RstRating" : "4.3", "RstTime" : "25-30 mins"],["RstImg" : "Rst4","RstName" : "Indiana Burgers", "RstRating" : "3.5", "RstTime" : "20-40 mins"],["RstImg" : "Rst5","RstName" : "HMR Biriyani Hut", "RstRating" : "4.6", "RstTime" : "25-50 mins"],["RstImg" : "Rst6","RstName" : "Mcdonald's", "RstRating" : "4.7", "RstTime" : "25-50 mins"],["RstImg" : "Rst7","RstName" : "Kharadi Restaurants", "RstRating" : "4.2", "RstTime" : "25-30 mins"],["RstImg" : "Rst8","RstName" : "Cock Ra Co", "RstRating" : "4.5", "RstTime" : "25-40 mins"],["RstImg" : "Rst9","RstName" : "Dosa Kadai", "RstRating" : "4.9", "RstTime" : "25-30 mins"],["RstImg" : "Rst10","RstName" : "Samosa Point", "RstRating" : "4.7", "RstTime" : "25-50 mins"],["RstImg" : "Rst1","RstName" : "Saravana Bhavan", "RstRating" : "4.5", "RstTime" : "30-45 mins"],["RstImg" : "Rst2","RstName" : "Krishna Restaurant", "RstRating" : "4.9", "RstTime" : "20-30 mins"],["RstImg" : "Rst3","RstName" : "Oven Story", "RstRating" : "4.3", "RstTime" : "25-30 mins"],["RstImg" : "Rst4","RstName" : "Indiana Burgers", "RstRating" : "3.5", "RstTime" : "20-40 mins"],["RstImg" : "Rst5","RstName" : "HMR Biriyani Hut", "RstRating" : "4.6", "RstTime" : "25-50 mins"],["RstImg" : "Rst6","RstName" : "Mcdonald's", "RstRating" : "4.7", "RstTime" : "25-50 mins"],["RstImg" : "Rst7","RstName" : "Kharadi Restaurants", "RstRating" : "4.2", "RstTime" : "25-30 mins"],["RstImg" : "Rst8","RstName" : "Cock Ra Co", "RstRating" : "4.5", "RstTime" : "25-40 mins"],["RstImg" : "Rst9","RstName" : "Dosa Kadai", "RstRating" : "4.9", "RstTime" : "25-30 mins"],["RstImg" : "Rst10","RstName" : "Samosa Point", "RstRating" : "4.7", "RstTime" : "25-50 mins"]]
    
        NRTableview.separatorStyle = .none // optional, hides the default separator line
        NRTableview.separatorInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0) // optional, adjust insets if necessary
        NRTableview.separatorColor = UIColor.clear // optional, if you hide the separator, clear the color
        NRTableview.backgroundColor = UIColor.clear
        
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
    
    
}
extension NearbyRestaurant: UITableViewDelegate, UITableViewDataSource{
            
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.popularRestaurant.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PopularRestaurntCell") as! PopularRestaurntCell
            cell.restaurntNameLbl.text = self.popularRestaurant[indexPath.item]["RstName"]
            cell.reataurantFoodImgVw.image = UIImage(named: self.popularRestaurant[indexPath.item]["RstImg"] ?? "")
            cell.RestaurntPrepareTimeLbl.text = self.popularRestaurant[indexPath.item]["RstTime"]
            cell.restaurantRatingLbl.text = self.popularRestaurant[indexPath.item]["RstRating"]
            

            cell.selectionStyle = .none
            return cell
        }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 310
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

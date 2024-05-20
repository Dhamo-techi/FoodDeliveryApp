//
//  ViewController.swift
//  DeliveryApp
//
//  Created by MAC PRO on 26/12/23.
//

import UIKit

class WhatWehave: UIViewController, UICollectionViewDelegate,  UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var backgroundImgView: UIImageView!
    
    @IBOutlet weak var autoscrollCollectionVw: UICollectionView!
    
    @IBOutlet weak var pagescroller: UIPageControl!
    
    @IBOutlet weak var skipBtn: UIButton!
    
    @IBOutlet weak var skipLbl: UILabel!
    
    var advertisement = [[String : String]]()
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let userloginstatus = UserDefaults.standard.bool(forKey: "isUserLoginTapped")
        if userloginstatus == true {
            let vc = storyboard?.instantiateViewController(identifier: "MyTabbarVC")
            self.navigationController?.pushViewController(vc!, animated: false)
        } else {
            let vc = storyboard?.instantiateViewController(identifier: "UserScreen") as! UserScreen
            self.navigationController?.pushViewController(vc, animated: false)
        }
        
        self.skipBtn.layer.cornerRadius = 40
        self.skipBtn.layer.shadowColor = UIColor.black.cgColor
        self.skipBtn.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.skipBtn.layer.masksToBounds = false
        self.skipBtn.layer.shadowRadius = 1.0
        self.skipBtn.layer.shadowOpacity = 90
        self.skipBtn.layer.cornerRadius = skipBtn.frame.width / 2
        
        self.autoscrollCollectionVw.backgroundColor = .clear
        
        self.navigationController?.isNavigationBarHidden = true
        
        self.autoscrollCollectionVw.showsHorizontalScrollIndicator = false
        
        self.advertisement = [["Adimg" : "Restaurant", "findLbl" : "Find a Restaurant"],["Adimg" : "food", "findLbl" : "Pick The Food"],["Adimg" : "delivery", "findLbl" : "Get Fastest Delivery"]]
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        self.autoscrollCollectionVw.collectionViewLayout = flowlayout
        
        self.startAutoScroll()
        
    }
    
    func startAutoScroll() {
        pagescroller.numberOfPages = advertisement.count
        pagescroller.currentPage = 0

        self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(changeimage), userInfo: nil, repeats: false)

        DispatchQueue.main.async {

            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.changeimage), userInfo: nil, repeats: true)

        }
    }
    
    @objc func changeimage() {
        if counter < advertisement.count {
               let index = IndexPath.init(item: counter, section: 0)
               self.autoscrollCollectionVw.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
               pagescroller.currentPage = counter
               counter += 1
           } else {
               counter = 0
               let index = IndexPath.init(item: counter, section: 0)
               self.autoscrollCollectionVw.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
               pagescroller.currentPage = counter
               counter += 1
           }

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return advertisement.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "scrollCollectionsCell", for: indexPath) as! scrollCollectionsCell
        
        cell.scrollImgView.image = UIImage(named: self.advertisement[indexPath.item]["Adimg"]!)
        cell.scrolltitleLbl.text = self.advertisement[indexPath.item]["findLbl"]
        cell.backgroundColor = .clear
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = autoscrollCollectionVw.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    
    @IBAction func skipBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "UserScreen")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
}


//
//  MyTabbarVC.swift
//  DeliveryApp
//
//  Created by MAC PRO on 22/02/24.
//

import UIKit

class MyTabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabBar.frame.size.height = 70
        
        UserDefaults.standard.set(true, forKey: "isUserLoginTapped")
        UserDefaults.standard.synchronize()
    }
    
}

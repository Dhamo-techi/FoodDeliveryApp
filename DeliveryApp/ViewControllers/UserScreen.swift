//
//  UserScreen.swift
//  DeliveryApp
//
//  Created by MAC PRO on 13/01/24.
//

import UIKit

class UserScreen: UIViewController {

    @IBOutlet weak var goodDayLbl: UILabel!
    
    @IBOutlet weak var subdetailLbl: UILabel!
    
    @IBOutlet weak var emojilogoImgVw: UIImageView!
    
    @IBOutlet weak var signinBtn: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var guestBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
        
        UserDefaults.standard.set(false, forKey: "isUserLoginTapped")
        UserDefaults.standard.synchronize()
        
        self.signinBtn.layer.cornerRadius = 30
        self.loginBtn.layer.cornerRadius = 30
        
        self.signinBtn.layer.shadowColor = UIColor(red: 0.39, green: 0.38, blue: 0.38, alpha: 1).cgColor
        self.signinBtn.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.signinBtn.layer.shadowRadius = 5
        self.signinBtn.layer.shadowOpacity = 1
        
        self.loginBtn.layer.shadowColor = UIColor(red: 0.39, green: 0.38, blue: 0.38, alpha: 1).cgColor
        self.loginBtn.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.loginBtn.layer.shadowRadius = 5
        self.loginBtn.layer.shadowOpacity = 1
        
        self.emojilogoImgVw.layer.shadowColor = UIColor(red: 0.39, green: 0.38, blue: 0.38, alpha: 1).cgColor
        self.emojilogoImgVw.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.emojilogoImgVw.layer.shadowRadius = 5
        self.emojilogoImgVw.layer.shadowOpacity = 1
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.updateGreeting()
    }
    
    func updateGreeting() {
           let date = Date()
           let calendar = Calendar.current
           let hour = calendar.component(.hour, from: date)
           
           var greeting: String
           
           switch hour {
           case 6..<12:
               greeting = "Good Morning"
           case 12..<16:
               greeting = "Good Afternoon"
           case 16..<19:
               greeting = "Good Evening"
           default:
               greeting = "Good Night"
           }
           
           goodDayLbl.text = greeting
       }
    
    @IBAction func signBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "SignupPage")
        self.navigationController?.pushViewController(vc!, animated: true)

    }
    
    @IBAction func loginBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "LoginPage")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func guestBtn(_ sender: Any) {
    }
    
    
}

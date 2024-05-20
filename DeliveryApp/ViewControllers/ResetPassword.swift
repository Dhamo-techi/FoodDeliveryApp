//
//  ResetPassword.swift
//  DeliveryApp
//
//  Created by MAC PRO on 22/01/24.
//

import UIKit

class ResetPassword: UIViewController {

    
    @IBOutlet weak var enterPasswordTxtfld: UITextField!
    
    @IBOutlet weak var ReenterPasswordTxtFld: UITextField!
    
    @IBOutlet weak var changeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
        
        self.ReenterPasswordTxtFld.layer.cornerRadius = 10
        self.enterPasswordTxtfld.layer.cornerRadius = 10
        self.changeBtn.layer.cornerRadius = 30
        
        self.enterPasswordTxtfld.layer.borderWidth = 3
        self.enterPasswordTxtfld.layer.borderColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1).cgColor
        
        self.ReenterPasswordTxtFld.layer.borderWidth = 3
        self.ReenterPasswordTxtFld.layer.borderColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1).cgColor
        
        let enterpassword = UIView(frame: CGRect(x: 0, y: 50, width: 70, height: 60))
        self.enterPasswordTxtfld.leftView = enterpassword
        self.enterPasswordTxtfld.leftViewMode = .always
        
        let reEnterpassword = UIView(frame: CGRect(x: 0, y: 50, width: 70, height: 60))
        self.ReenterPasswordTxtFld.leftView = reEnterpassword
        self.ReenterPasswordTxtFld.leftViewMode = .always
     
        

        
    }
    
    @IBAction func changeBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "LoginPage")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

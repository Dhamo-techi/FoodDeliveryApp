//
//  LoginPage.swift
//  DeliveryApp
//
//  Created by MAC PRO on 14/01/24.
//

import UIKit


class LoginPage: UIViewController, UITextFieldDelegate {
    
    weak var delegate: LoginDelegate?
    
    @IBOutlet weak var emailTxtfld: UITextField!
    
    @IBOutlet weak var pswdTxtfld: UITextField!
    
    @IBOutlet weak var showpswdBtn: UIButton!
    
    @IBOutlet weak var saveinfoSwitch: UISwitch!
    
    @IBOutlet weak var forgotPswdBtn: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var line1: UIView!
    
    @IBOutlet weak var line2: UIView!
    
    @IBOutlet weak var signupBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
        
        self.loginBtn.layer.cornerRadius = 30
        self.emailTxtfld.layer.cornerRadius = 15
        self.pswdTxtfld.layer.cornerRadius = 15
        
        self.emailTxtfld.layer.borderWidth = 3
        self.emailTxtfld.layer.borderColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1).cgColor
        
        self.line1.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
        
        
        self.pswdTxtfld.layer.borderWidth = 3
        self.pswdTxtfld.layer.borderColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1).cgColor
        self.line2.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
        
        let emailpaddingview = UIView(frame: CGRect(x: 0, y: 50, width: 70, height: 60))
        self.emailTxtfld.leftView = emailpaddingview
        self.emailTxtfld.leftViewMode = .always
        
        let pswdpaddingview = UIView(frame: CGRect(x: 0, y: 50, width: 70, height: 60))
        self.pswdTxtfld.leftView = pswdpaddingview
        self.pswdTxtfld.leftViewMode = .always
        
        self.pswdTxtfld.isSecureTextEntry = true
        showpswdBtn.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
    }
    
    @objc func togglePasswordVisibility() {
        pswdTxtfld.isSecureTextEntry.toggle()
    }
    
    @IBAction func showpswdBtn(_ sender: Any) {
    }
    
    @IBAction func forgotPswdBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "Forgot_Password")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        
        let message = "Login successful!"
        let submessage = "Welcome Back Let's Order food and Enjoy your Meal"
        delegate?.didLoginSuccessfully(message: message, submessage: submessage)
        
        let vc = storyboard?.instantiateViewController(identifier: "MyTabbarVC")
        self.navigationController?.pushViewController(vc!, animated: true)

    }
    
    @IBAction func signupBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "SignupPage")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailTxtfld{
            self.pswdTxtfld.becomeFirstResponder()
        }
        else if textField == pswdTxtfld{
            self.pswdTxtfld.resignFirstResponder()
        }
        return true
    }
    
    
    
}

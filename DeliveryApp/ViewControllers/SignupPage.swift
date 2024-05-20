//
//  SignupPage.swift
//  DeliveryApp
//
//  Created by MAC PRO on 17/01/24.
//

import UIKit
import CoreData

class SignupPage: UIViewController, UITextFieldDelegate {
    
    var activeTextField: UITextField?

    var passfinal = NSManagedObject()

    @IBOutlet weak var nameTxtfld: UITextField!
    
    
    @IBOutlet weak var emailTxtfld: UITextField!
    
    
    @IBOutlet weak var pswdTxtfld: UITextField!
    
    
    @IBOutlet weak var showpswdBtn: UIButton!
    
    
    @IBOutlet weak var SUloginBtn: UIButton!
    
    
    @IBOutlet weak var AldLoginBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
        
        self.SUloginBtn.layer.cornerRadius = 30
        self.emailTxtfld.layer.cornerRadius = 20
        self.pswdTxtfld.layer.cornerRadius = 20
        self.nameTxtfld.layer.cornerRadius = 20

        self.nameTxtfld.layer.borderWidth = 3
        self.nameTxtfld.layer.borderColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1).cgColor
        
        self.emailTxtfld.layer.borderWidth = 3
        self.emailTxtfld.layer.borderColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1).cgColor
        
        self.pswdTxtfld.layer.borderWidth = 3
        self.pswdTxtfld.layer.borderColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1).cgColor
        
        let namepaddingview = UIView(frame: CGRect(x: 0, y: 50, width: 70, height: 60))
        self.nameTxtfld.leftView = namepaddingview
        self.nameTxtfld.leftViewMode = .always
        
        let emailpaddingview = UIView(frame: CGRect(x: 0, y: 50, width: 70, height: 60))
        self.emailTxtfld.leftView = emailpaddingview
        self.emailTxtfld.leftViewMode = .always
        
        let pswdpaddingview = UIView(frame: CGRect(x: 0, y: 50, width: 70, height: 60))
        self.pswdTxtfld.leftView = pswdpaddingview
        self.pswdTxtfld.leftViewMode = .always
        
        self.pswdTxtfld.isSecureTextEntry = true
        showpswdBtn.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
    
    deinit {
        // Remove keyboard notification observers
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if let activeTextField = activeTextField {
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY
            let topOfKeyboard = self.view.frame.height - keyboardSize.height
            let padding: CGFloat = 10
            
            if bottomOfTextField > topOfKeyboard {
                let offsetY = bottomOfTextField - topOfKeyboard + padding
                let newFrame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y - offsetY, width: self.view.frame.size.width, height: self.view.frame.size.height)
                self.view.frame = newFrame
            }
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func togglePasswordVisibility() {
            pswdTxtfld.isSecureTextEntry.toggle()
        }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == nameTxtfld{
            self.emailTxtfld.becomeFirstResponder()
        }
        else if textField == emailTxtfld{
            self.pswdTxtfld.becomeFirstResponder()
        }
        else if textField == pswdTxtfld{
            self.pswdTxtfld.resignFirstResponder()
        }
        return true
    }

    @IBAction func showpswdBtn(_ sender: Any) {
    }
    
    
    @IBAction func SUloginBtn(_ sender: Any) {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        let newuser = NSEntityDescription.insertNewObject(forEntityName: "UserProfileData", into: context)
        newuser.setValue(self.nameTxtfld.text ?? "", forKey:"userName")
        newuser.setValue(self.emailTxtfld.text ?? "", forKey:"userEmail")
        newuser.setValue(self.pswdTxtfld.text ?? "", forKey:"userPassword")
            
        do {
            try context.save()
        } catch let err as NSError {
            print(err.localizedDescription)
        }
                
        let vc = storyboard?.instantiateViewController(identifier: "LoginPage")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func AldLoginBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "LoginPage")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    
    

}

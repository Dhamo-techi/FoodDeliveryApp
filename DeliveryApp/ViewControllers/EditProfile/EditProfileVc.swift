//
//  EditProfileVc.swift
//  DeliveryApp
//
//  Created by MAC PRO on 20/03/24.
//

import UIKit
import CoreData

class EditProfileVc: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate, UITextFieldDelegate {
    
    var activeTextField: UITextField?
    
    @IBOutlet weak var itemTitleLbl: UILabel!
    @IBOutlet weak var MScrollVw: UIScrollView!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBOutlet weak var notifyBtn: UIButton!
    
    @IBOutlet weak var profileImgVw: UIImageView!
    
    @IBOutlet weak var UsernameLbl: UILabel!
    
    @IBOutlet weak var updateProfileBtn: UIButton!
    
    @IBOutlet weak var nameTxtFld: UITextField!
    
    @IBOutlet weak var emailTxtFld: UITextField!
    
    @IBOutlet weak var addressTxtFld: UITextField!
    
    @IBOutlet weak var mblNumberTxtFld: UITextField!
    
    @IBOutlet weak var updateBtn: UIButton!
    
    var recieveValue : NSManagedObject? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        nameTxtFld.delegate = self
        emailTxtFld.delegate = self
        mblNumberTxtFld.delegate = self
        addressTxtFld.delegate = self
        
        self.navigationController?.isNavigationBarHidden = true
        BackGesture.addBackGesture(to: self, action: #selector(handleSwipeGesture))
       
        self.backgroundView.layer.shadowColor = UIColor(red: 0.39, green: 0.38, blue: 0.38, alpha: 1).cgColor
        self.backgroundView.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.backgroundView.layer.shadowRadius = 5
        self.backgroundView.layer.shadowOpacity = 1
        
        self.backBtn.layer.borderWidth = 2.0
        self.backBtn.layer.borderColor = UIColor.secondarySystemFill.cgColor
        
        self.profileImgVw.layer.cornerRadius = 75.0
        self.backgroundView.layer.cornerRadius = 75.0
        
        self.backBtn.layer.cornerRadius = 15
        self.updateBtn.layer.cornerRadius = 30
        self.updateProfileBtn.layer.cornerRadius = 15
        
        self.nameTxtFld.layer.cornerRadius = 10
        self.nameTxtFld.layer.borderWidth = 2
        self.nameTxtFld.layer.borderColor = UIColor.secondarySystemFill.cgColor
        
        let namepaddingview = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 60))
        self.nameTxtFld.leftView = namepaddingview
        self.nameTxtFld.leftViewMode = .always
        
        self.emailTxtFld.layer.cornerRadius = 10
        self.emailTxtFld.layer.borderWidth = 2
        self.emailTxtFld.layer.borderColor = UIColor.secondarySystemFill.cgColor
        self.emailTxtFld.keyboardType = .emailAddress
        
        let emailpaddingview = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 60))
        self.emailTxtFld.leftView = emailpaddingview
        self.emailTxtFld.leftViewMode = .always
        
        self.mblNumberTxtFld.layer.cornerRadius = 10
        self.mblNumberTxtFld.layer.borderWidth = 2
        self.mblNumberTxtFld.layer.borderColor = UIColor.secondarySystemFill.cgColor
        
        let MblNumberpaddingview = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 60))
        self.mblNumberTxtFld.leftView = MblNumberpaddingview
        self.mblNumberTxtFld.leftViewMode = .always
        
        self.addressTxtFld.layer.cornerRadius = 10
        self.addressTxtFld.layer.borderWidth = 2
        self.addressTxtFld.layer.borderColor = UIColor.secondarySystemFill.cgColor
        
        let addresspaddingview = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 60))
        self.addressTxtFld.leftView = addresspaddingview
        self.addressTxtFld.leftViewMode = .always
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        if self.recieveValue != nil{
            self.UsernameLbl.text = self.recieveValue?.value(forKey: "userName") as? String
            
            self.nameTxtFld.text = self.recieveValue?.value(forKey: "userName") as? String
            self.emailTxtFld.text = self.recieveValue?.value(forKey: "userEmail") as? String
            self.mblNumberTxtFld.text = self.recieveValue?.value(forKey: "userMblNumber") as? String
            self.addressTxtFld.text = self.recieveValue?.value(forKey: "userAddress") as? String
            
        }
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeTextField = nil
    }
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == nameTxtFld{
            self.emailTxtFld.becomeFirstResponder()
        }
        else if textField == emailTxtFld{
            self.mblNumberTxtFld.becomeFirstResponder()
        }
        else if textField == mblNumberTxtFld{
            self.addressTxtFld.becomeFirstResponder()
        }
        else if textField == addressTxtFld{
            self.addressTxtFld.resignFirstResponder()
        }
        return true
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
    
    @IBAction func notifyBtnTapped(_ sender: Any) {
    }
    
    @IBAction func updateProfileBtnTapped(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImgVw.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func updateBtnTapped(_ sender: Any) {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        if self.recieveValue != nil{
            self.recieveValue?.setValue(self.nameTxtFld.text ?? "", forKey: "userName")
            self.recieveValue?.setValue(self.emailTxtFld.text ?? "", forKey: "userEmail")
            self.recieveValue?.setValue(self.mblNumberTxtFld.text ?? "", forKey: "userMblNumber")
            self.recieveValue?.setValue(self.addressTxtFld.text ?? "Add your Address by clicking EditProfile Button", forKey: "userAddress")
            
            
        }else{
            let newuser = NSEntityDescription.insertNewObject(forEntityName: "UserProfileData", into: context)
            newuser.setValue(self.nameTxtFld.text ?? "", forKey:"userName")
            newuser.setValue(self.emailTxtFld.text ?? "", forKey:"userEmail")
            newuser.setValue(self.mblNumberTxtFld.text ?? "", forKey:"userMblNumber")
            newuser.setValue(self.addressTxtFld.text ?? "", forKey:"userAddress")
            
        }
        
        do {
            try context.save()
        } catch let err as NSError {
            print(err.localizedDescription)
        }
        
        if nameTxtFld.text?.isEmpty ?? true || emailTxtFld.text?.isEmpty ?? true || addressTxtFld.text?.isEmpty ?? true || mblNumberTxtFld.text?.isEmpty ?? true {
                    // At least one of the text fields is empty
                    showAlert(message: "Please fill in all text fields.")
                } else {
                    self.navigationController?.popViewController(animated: true)
                }
    }
    
    func showAlert(message: String) {
            let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    
    
}


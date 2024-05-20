//
//  AddAddressVC.swift
//  DeliveryApp
//
//  Created by MAC PRO on 24/04/24.
//

import UIKit

class AddAddressVC: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var titleTxtFld: UITextField!
    
    @IBOutlet weak var MblNumTxtfld: UITextField!
    
    @IBOutlet weak var AddressTxtFLd: UITextField!
    
    @IBOutlet weak var updateBtn: UIButton!
    
    weak var delegate: UpdateDataDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        titleTxtFld.delegate = self
        MblNumTxtfld.delegate = self
        AddressTxtFLd.delegate = self
        
        self.backBtn.layer.borderWidth = 2.0
        self.backBtn.layer.borderColor = UIColor.secondarySystemFill.cgColor
        self.backBtn.layer.cornerRadius = 15
        
        self.updateBtn.layer.cornerRadius = 30
        
        self.titleTxtFld.layer.cornerRadius = 10
        self.titleTxtFld.layer.borderWidth = 2
        self.titleTxtFld.layer.borderColor = UIColor.secondarySystemFill.cgColor
        setLeftView(for: titleTxtFld, width: 20, height: 60)
        self.titleTxtFld.placeholder = "Enter the Address Title"
        
        
        self.MblNumTxtfld.layer.cornerRadius = 10
        self.MblNumTxtfld.layer.borderWidth = 2
        self.MblNumTxtfld.layer.borderColor = UIColor.secondarySystemFill.cgColor
        setLeftView(for: MblNumTxtfld, width: 20, height: 60)
        self.MblNumTxtfld.placeholder = "Enter your Mobile Number"
        self.MblNumTxtfld.keyboardType = .phonePad
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(didTapdone))
        toolBar.items = [flexibleSpace, doneButton]
        toolBar.sizeToFit()
        MblNumTxtfld.inputAccessoryView = toolBar
        
        self.AddressTxtFLd.layer.cornerRadius = 10
        self.AddressTxtFLd.layer.borderWidth = 2
        self.AddressTxtFLd.layer.borderColor = UIColor.secondarySystemFill.cgColor
        setLeftView(for: AddressTxtFLd, width: 20, height: 60)
        self.AddressTxtFLd.placeholder = "Enter the Address"
        
    }
    
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func updateBtnTapped(_ sender: Any) {
        
        if titleTxtFld.text?.isEmpty ?? true || MblNumTxtfld.text?.isEmpty ?? true || AddressTxtFLd.text?.isEmpty ?? true {
            
            showAlert(message: "Please Fill all the Above Address Details")
            
        } else {
            let data = AddressData(TitleTxt: titleTxtFld.text ?? "", MblNumTxt: MblNumTxtfld.text ?? "", AddressTxt: AddressTxtFLd.text ?? "")
                    delegate?.updateData(withData: [data])
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == titleTxtFld{
            self.MblNumTxtfld.becomeFirstResponder()
        }
        else if textField == AddressTxtFLd{
            self.AddressTxtFLd.resignFirstResponder()
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if textField == MblNumTxtfld {

                let allowedCharacters = CharacterSet(charactersIn: "0123456789-()").inverted
                let filteredString = string.components(separatedBy: allowedCharacters).joined(separator: "")
                
                let newString = (textField.text! as NSString).replacingCharacters(in: range, with: filteredString)
                return newString.count <= 10
            }
            return true
    }
    
    @objc func didTapdone(){
        AddressTxtFLd.becomeFirstResponder()
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func setLeftView(for textField: UITextField, width: CGFloat, height: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
}

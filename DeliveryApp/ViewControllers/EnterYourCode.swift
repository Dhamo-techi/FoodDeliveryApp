//
//  EnterYourCode.swift
//  DeliveryApp
//
//  Created by MAC PRO on 18/01/24.
//

import UIKit

class EnterYourCode: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var codetxtfld1: UITextField!
    
    @IBOutlet weak var codeTxtfld2: UITextField!
    
    @IBOutlet weak var codeTxtfld3: UITextField!
    
    @IBOutlet weak var codeTxtfld4: UITextField!
    
    @IBOutlet weak var codeStackvw: UIStackView!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
        self.codetxtfld1.keyboardType = UIKeyboardType.phonePad
        self.codeTxtfld2.keyboardType = UIKeyboardType.phonePad
        self.codeTxtfld3.keyboardType = UIKeyboardType.phonePad
        self.codeTxtfld4.keyboardType = UIKeyboardType.phonePad

        
        self.nextBtn.layer.cornerRadius = 30
        self.codetxtfld1.layer.cornerRadius = 10
        self.codeTxtfld2.layer.cornerRadius = 10
        self.codeTxtfld3.layer.cornerRadius = 10
        self.codeTxtfld4.layer.cornerRadius = 10
        
        let codepaddingview1 = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 53))
        self.codetxtfld1.leftView = codepaddingview1
        self.codetxtfld1.leftViewMode = .always
        
        let Codepaddingview2 = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 53))
        self.codeTxtfld2.leftView = Codepaddingview2
        self.codeTxtfld2.leftViewMode = .always
        
        let Codepaddingview3 = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 53))
        self.codeTxtfld3.leftView = Codepaddingview3
        self.codeTxtfld3.leftViewMode = .always
        
        let Codepaddingview4 = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 53))
        self.codeTxtfld4.leftView = Codepaddingview4
        self.codeTxtfld4.leftViewMode = .always
        
        self.codetxtfld1.layer.borderWidth = 3
        self.codetxtfld1.layer.borderColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1).cgColor
        
        self.codeTxtfld2.layer.borderWidth = 3
        self.codeTxtfld2.layer.borderColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1).cgColor
        
        self.codeTxtfld3.layer.borderWidth = 3
        self.codeTxtfld3.layer.borderColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1).cgColor
        
        self.codeTxtfld4.layer.borderWidth = 3
        self.codeTxtfld4.layer.borderColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1).cgColor
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if string.count == 1 && CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: string)) {
                textField.text = string
                textField.resignFirstResponder()
                switchToNextTextField(currentTextField: textField)
            }else if string.isEmpty && textField.text?.isEmpty == false {
                textField.text = nil

                switchToPreviousTextField(currentTextField: textField)
            }

            return false

        }

        func switchToNextTextField(currentTextField: UITextField) {
            if let currentIndex = textFields.firstIndex(of: currentTextField) {
                let nextIndex = currentIndex + 1
                if nextIndex < textFields.count {
                    textFields[nextIndex].becomeFirstResponder()
                }
            }
        }
    
    func switchToPreviousTextField(currentTextField: UITextField) {
            if let currentIndex = textFields.firstIndex(of: currentTextField) {
                let previousIndex = currentIndex - 1
                if previousIndex >= 0 {
                    textFields[previousIndex].becomeFirstResponder()
                }
            }
        }

    @IBAction func resendcodeBtn(_ sender: Any) {
    }
    
    
    @IBAction func nextbtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ResetPassword")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    var textFields: [UITextField] {
        return [codetxtfld1, codeTxtfld2, codeTxtfld3, codeTxtfld4]
    }
    
}

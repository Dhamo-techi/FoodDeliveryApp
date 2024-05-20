//
//  Forgot Password.swift
//  DeliveryApp
//
//  Created by MAC PRO on 17/01/24.
//

import UIKit

class Forgot_Password: UIViewController {
    
    
    @IBOutlet weak var phnnumTxtFld: UITextField!
    
    
    @IBOutlet weak var nextBTn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
        self.phnnumTxtFld.keyboardType = UIKeyboardType.phonePad
        
        self.phnnumTxtFld.layer.cornerRadius = 20
        self.nextBTn.layer.cornerRadius = 30

        self.phnnumTxtFld.layer.borderWidth = 3
        self.phnnumTxtFld.layer.borderColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1).cgColor
        
        let Phnnumpaddingview = UIView(frame: CGRect(x: 0, y: 50, width: 70, height: 60))
        self.phnnumTxtFld.leftView = Phnnumpaddingview
        self.phnnumTxtFld.leftViewMode = .always
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(didTapdone))
        toolBar.items = [flexibleSpace, doneButton]
        toolBar.sizeToFit()
        phnnumTxtFld.inputAccessoryView = toolBar
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "EnterYourCode")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @objc func didTapdone(){
        phnnumTxtFld.resignFirstResponder()
    }
    
    

}

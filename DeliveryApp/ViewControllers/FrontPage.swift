//
//  FrontPage.swift
//  DeliveryApp
//
//  Created by MAC PRO on 23/01/24.
//

import UIKit

class FrontPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.performSegue(withIdentifier: "mySegue", sender: self)
                }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "mySegue" {
                
            }
    }
    

    

}

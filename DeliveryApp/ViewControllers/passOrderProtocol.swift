//
//  passOrderProtocol.swift
//  DeliveryApp
//
//  Created by MAC PRO on 19/03/24.
//

import Foundation
import UIKit


struct CartItem {
    var image: UIImage
    var name: String
    var price: Int
    var quantity: Int
}


protocol UpdateDataDelegate: AnyObject {
    func updateData(withData data: [AddressData])
}


struct AddressData {
    var TitleTxt: String
    var MblNumTxt: String
    var AddressTxt: String
}





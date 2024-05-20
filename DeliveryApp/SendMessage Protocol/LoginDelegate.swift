//
//  LoginDelegate.swift
//  DeliveryApp
//
//  Created by MAC PRO on 27/03/24.
//

import Foundation

protocol LoginDelegate: AnyObject {
    func didLoginSuccessfully(message: String, submessage: String)

}


//
//  BackGesture.swift
//  DeliveryApp
//
//  Created by MAC PRO on 06/02/24.
//

import Foundation
import UIKit

class BackGesture {
   
    static func addBackGesture(to viewController: UIViewController, action: Selector) {
        let swipeGesture = UISwipeGestureRecognizer(target: viewController, action: action)
        swipeGesture.direction = .right
        viewController.view.addGestureRecognizer(swipeGesture)
    }
}


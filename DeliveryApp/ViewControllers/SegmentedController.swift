//
//  SegmentedController.swift
//  DeliveryApp
//
//  Created by MAC PRO on 28/02/24.
//

import UIKit

class SegmentedController: UISegmentedControl {

    override func layoutSubviews() {
            super.layoutSubviews()
            layer.cornerRadius = frame.height / 2 // Adjust the value to change the roundness
            clipsToBounds = true
        }
   
}

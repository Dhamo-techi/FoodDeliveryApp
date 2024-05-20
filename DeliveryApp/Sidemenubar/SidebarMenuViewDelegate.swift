//
//  SidebarMenuViewDelegate.swift
//  DeliveryApp
//
//  Created by MAC PRO on 15/03/24.
//

import Foundation

protocol SidebarMenuViewDelegate: AnyObject {
    func sidebarMenuDidCancel()
    
    func sidebarMenuDidSelect(itemName: String)
    
    
}

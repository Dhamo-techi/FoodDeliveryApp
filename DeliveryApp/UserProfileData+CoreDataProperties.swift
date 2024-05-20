//
//  UserProfileData+CoreDataProperties.swift
//  DeliveryApp
//
//  Created by MAC PRO on 25/03/24.
//
//

import Foundation
import CoreData


extension UserProfileData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserProfileData> {
        return NSFetchRequest<UserProfileData>(entityName: "UserProfileData")
    }

    @NSManaged public var userAddress: String?
    @NSManaged public var userEmail: String?
    @NSManaged public var userMblNumber: String?
    @NSManaged public var userName: String?
    @NSManaged public var userPassword: String?
    @NSManaged public var userProfile: BinaryData?

}

extension UserProfileData : Identifiable {

}

//
//  SavedUser+CoreDataProperties.swift
//  FriendFace
//
//  Created by Joseph Faragalla on 2020-08-21.
//  Copyright © 2020 Joseph. All rights reserved.
//
//

import Foundation
import CoreData


extension SavedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedUser> {
        return NSFetchRequest<SavedUser>(entityName: "SavedUser")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var friend: NSSet?

}

// MARK: Generated accessors for friend
extension SavedUser {

    @objc(addFriendObject:)
    @NSManaged public func addToFriend(_ value: SavedFriend)

    @objc(removeFriendObject:)
    @NSManaged public func removeFromFriend(_ value: SavedFriend)

    @objc(addFriend:)
    @NSManaged public func addToFriend(_ values: NSSet)

    @objc(removeFriend:)
    @NSManaged public func removeFromFriend(_ values: NSSet)

}

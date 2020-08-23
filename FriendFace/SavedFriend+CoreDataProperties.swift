//
//  SavedFriend+CoreDataProperties.swift
//  FriendFace
//
//  Created by Joseph Faragalla on 2020-08-21.
//  Copyright © 2020 Joseph. All rights reserved.
//
//

import Foundation
import CoreData


extension SavedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedFriend> {
        return NSFetchRequest<SavedFriend>(entityName: "SavedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var friendOf: NSSet?

}

// MARK: Generated accessors for friendOf
extension SavedFriend {

    @objc(addFriendOfObject:)
    @NSManaged public func addToFriendOf(_ value: SavedUser)

    @objc(removeFriendOfObject:)
    @NSManaged public func removeFromFriendOf(_ value: SavedUser)

    @objc(addFriendOf:)
    @NSManaged public func addToFriendOf(_ values: NSSet)

    @objc(removeFriendOf:)
    @NSManaged public func removeFromFriendOf(_ values: NSSet)

}

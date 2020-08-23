//
//  SavedFriend+CoreDataClass.swift
//  FriendFace
//
//  Created by Joseph Faragalla on 2020-08-21.
//  Copyright © 2020 Joseph. All rights reserved.
//
//

import Foundation
import CoreData

extension CodingUserInfoKey {
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
    
}

@objc(SavedFriend)
public class SavedFriend: NSManagedObject, Identifiable, Codable {
    
    enum CodingKeys: CodingKey {
        case name, id
    }
    
    public required convenience init(from decoder: Decoder) throws {
        //add this so we can reference the managed Object Context in our class
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            print("Missing managed object context")
        }
        
        self.init(context: context)
        
        //from here its the same as any other struct
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        
        
        
    }

}

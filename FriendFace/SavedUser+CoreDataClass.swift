//
//  SavedUser+CoreDataClass.swift
//  FriendFace
//
//  Created by Joseph Faragalla on 2020-08-21.
//  Copyright © 2020 Joseph. All rights reserved.
//
//

import Foundation
import CoreData

@objc(SavedUser)
public class SavedUser: NSManagedObject, Identifiable, Codable {
    
    //create coding Keys like usual
    enum CodingKeys: CodingKey {
        case name, about, address, age, company, email, id, friend
    }

    
    public required convenience init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
             print("mssing managed Object Context")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.about = try container.decode(String.self, forKey: .about)
        self.address = try container.decode(String.self, forKey: .address)
        self.age = try container.decode(Int16.self, forKey: .age)
        self.company = try container.decode(String.self, forKey: .company)
        self.email = try container.decode(String.self, forKey: .email)
        self.id = try container.decode(UUID.self, forKey: .id)
        //STILL HAVE TO DO FRIENDS
        
    }

}

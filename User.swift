//
//  User.swift
//  FriendFace
//
//  Created by Joseph Faragalla on 2020-08-19.
//  Copyright © 2020 Joseph. All rights reserved.
//

import Foundation


struct User: Codable, Identifiable {
    var id: UUID
    
    var name: String
    var age: Int?
    var company: String?
    var email: String?
   
    //think about making this a real address later
    var address: String?
    
    var about: String?
    var friends: [User]?
    
    //unwrapping all the stuff in one place
    var wrappedAge: Int {
        age ?? 0
    }
    var wrappedCompany: String {
        company ?? "Unknown company"
    }
    var wrappedEmail: String {
        email ?? "Unknown-email@gmail.com"
    }
    var wrappedAddress: String {
        address ?? "Unknown Address"
    }
    var wrappedAbout: String {
        about ?? "We know nothing about this guy"
    }
    
    
}

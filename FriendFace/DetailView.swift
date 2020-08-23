//
//  DetailView.swift
//  FriendFace
//
//  Created by Joseph Faragalla on 2020-08-20.
//  Copyright © 2020 Joseph. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var user: User
    var userList: [User]
    var friends = [User]()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
            Form {
                Section {
                    Text("Age: \(user.wrappedAge)")
                    Text("Company: \(user.wrappedCompany)")
                    Text("Email: \(user.wrappedEmail)")
                }
                Section {
                    Text("About \(user.name):")
                    Text(user.wrappedAbout)
                }
                if !friends.isEmpty {
                    List(friends) { friend in
                        NavigationLink(destination: DetailView(user: friend, userList: self.userList)
                        
                        ) {
                            Text(friend.name)
                        }
                        
                    }
                }
                
            }
        .navigationBarTitle(user.name)
        //creating a custom back buttton that goes back to the main list
        
    }
    
    init(user: User, userList: [User]) {
        self.user = user
        self.userList = userList
        //this is really bad for ram. First(where: ) is better
        for friend in user.friends! {
            for user in userList {
                if user.id == friend.id {
                    friends.append(user)
                }
            }
        }
    }
}


//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(user: User(id: UUID(), name: "John", age: 18, company: "abcd", email: "abcd@gmail.com", address: "123 happy street", about: "description description", friends: nil), userList: )
//    }
//}

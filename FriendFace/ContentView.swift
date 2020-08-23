//
//  ContentView.swift
//  FriendFace
//
//  Created by Joseph Faragalla on 2020-08-19.
//  Copyright © 2020 Joseph. All rights reserved.
//

//Time Costing Mistakes so far:
//-swift added random mutating to loadData func.
//-didnt look closely at JSON file. No initial object. Just an array. Created a whole useless class wrapper that didnt work

//hippity hoppatus

import SwiftUI
//to make core Data objects conform to Codable. NOt sure why it is needed
extension CodingUserInfoKey {
   static let context = CodingUserInfoKey(rawValue: "context")
}

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: SavedUser.entity(), sortDescriptors: []) var users: FetchedResults<SavedUser>
    
    
    @State private var userList = [User]()
    @State private var showDetailView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(userList) { user in
                    NavigationLink(destination: DetailView(user: user, userList: self.userList)) {
                        Text("\(user.name) - (\(user.wrappedAge))")
                    }
                }
            }
            .onAppear(perform: loadData)
        .navigationBarTitle("Friend Face")
        }
    }
    
    func loadData() {
        //creating the url
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            fatalError("url not found")
        }
        //creating url request
        let request = URLRequest(url: url)
        
        //creating and starting a networking task
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                //The JSON file starts out as an array so I am unable to decode it into an initial struct or class.Must be an array
                if let decodedResponse = try? JSONDecoder().decode(Array<User>.self, from: data) {
                    
                    //run this only once
                    if self.userList.isEmpty {
                        self.userList = decodedResponse
                        
                    }
                    
                    print("Total users \(self.userList.count)")
                    return
                }
                else {
                   
                    fatalError("unable able to convert JSON to object")
                }
            }
            else {
                
                print("Invalid response from server")
            }
            //if we are here, something went wrong
            print("Fetch failed: \(error?.localizedDescription ?? "unknown error")")
            
        }.resume()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

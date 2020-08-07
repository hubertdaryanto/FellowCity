//
//  AddFriendsAlertView.swift
//  FellowCity
//
//  Created by Feri Fajri on 05/08/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct AddFriendsAlertView: View {
 
    // MARK: - Variable for Dummy Data
    
    let screenSize = UIScreen.main.bounds
    @Binding var isShown: Bool
    
    var title: String = "Add Friend"
    var onAdd: (String) -> Void = { _ in }
    var onCancel: () -> Void = { }
    
    // Search Term
    @State var searchTerm: String = ""
    @Binding var userID: String
    // List All User
    @State var allRideUser:[AllRideUser]
    let nameArrayOfAllRideUsers = allRideUsers.map { $0.name }
    
    // MARK: - Variable for Core Data
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: FriendLists.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \FriendLists.name, ascending: true)]) var myFriends: FetchedResults<FriendLists>
    

    var body: some View {
        VStack{
                Text("Add Friend")
                    .font(.body)
                    .fontWeight(.bold)
            
                Text("Increase your riding buddies!")
                    .font(.footnote)

                TextField("Friend Name", text: $userID)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            
                SearchBarList(textSearch: $searchTerm, placeholder: "Search here...")
            
            List {
                
                ForEach(self.myFriends.filter {
                    self.searchTerm.isEmpty ? true :
                        
//                        Using Dummy Data | self.nameArrayOfAllRideUsers.filter
//                        $0.localizedCaseInsensitiveContains(self.searchTerm)
                        
                        //Using CoreData
                        $0.name!.contains(self.searchTerm)

                    }, id: \.self)
                { index in
                    Button(action: {
                        self.userID = index.name!
                    }) {
                        Text("\(index.name!)")
                    }
                }
            }.frame(height: 150)
            Divider()
                HStack{
                    Spacer()
                    Button("Cancel"){
                        self.isShown = false
                        self.onCancel()
                    }
                    Group {
                        Spacer()
                        Divider()
                        Spacer()
                    }
                    Button("Add"){
                        
                        
                        self.onAdd(self.userID)
                        
                        // Add Friends to List in Core Data
                        let myFriends = FriendLists(context: self.managedObjectContext)
                        myFriends.name = "\(self.userID)"
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            // handle the Core Data error
                        }
                        
                        // Move Alert to Background
                        self.isShown = false
                        
                    }
                    Spacer()
                }
            
            
        }
        .padding()
        .frame(width: screenSize.width * 0.8, height: screenSize.height * 0.45)
        .background(Color(hex: 0xF2f2f2, alpha: 1))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .offset(y: isShown ? 0 : screenSize.height)
        .animation(.spring())
        .shadow(radius: 1, x: 1, y: 1)
        
    }
}

struct AddFriendsAlertView_Previews: PreviewProvider {
    static var previews: some View {
        AddFriendsAlertView(isShown: .constant(true), userID: .constant(""), allRideUser: allRideUsers)
    }
}



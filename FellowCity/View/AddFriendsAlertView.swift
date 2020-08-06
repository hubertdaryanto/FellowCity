//
//  AddFriendsAlertView.swift
//  FellowCity
//
//  Created by Feri Fajri on 05/08/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct AddFriendsAlertView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    let screenSize = UIScreen.main.bounds
    @Binding var isShown: Bool
    @Binding var userID: String
    var title: String = "Add Friend"
    var onAdd: (String) -> Void = { _ in }
    var onCancel: () -> Void = { }
    
    @State var searchTerm: String = ""
    //    var users: [User]var explores:[ExploreRevised]
    @State var allRideUser:[AllRideUser]
    
    //    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: FriendLists.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \FriendLists.name, ascending: true)]) var myFriends: FetchedResults<FriendLists>
    
    let arrAttributeTitles = FriendLists.entity().attributesByName.enumerated().map { $0.element.key }
    //    let myPerson = FriendLists.existingObject(with: $0.name)
    let nameArrayOfAllRideUsers = allRideUsers.map { $0.name }
    
 
    
    
    
    
    var body: some View {
        
        
        
        VStack{
            //            Spacer()
            
            Group {
            Text("Add Friend")
                .font(.body)
                .fontWeight(.bold)
            Text("Increase your riding buddies!")
                .font(.footnote)
            //            .fontWeight(.bold)
            //            Spacer()
            TextField("Friend ID", text: $userID)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Group {
            SearchBarList(textSearch: $searchTerm)
            }
            
            List {
                
                
                
                ForEach(self.myFriends.filter {
                    self.searchTerm.isEmpty ? true :
//                    $0.localizedCaseInsensitiveContains(self.searchTerm)
                    $0.name!.contains(self.searchTerm)
//                    ($0.name?.lowercased().contains(self.searchTerm.lowercased()))!
//                    $0.name!.lowercased().contains(self.searchTerm)|| self.searchTerm.isEmpty
                    }, id: \.self)
                { namea in
                    
                    //
                    
                    
                    Button(action: {
                        self.userID = namea.name!
                    }) {
                    Text("\(namea.name!)")
                    }
                    
                    
                    
                    //                    ForEach(myFriends, id: \.self)
                    //                    { (index: FriendLists) in
                    //
                    //                        //
                    //
                    //
                    //                        Button(action: {
                    //                            self.userID = index.name ?? ""
                    //                            //                        self.isHidden.toggle()
                    //                        }) {
                    //                            Text("\(index.name ?? "")")
                    //                        }
                    
                    
                    
                }
            }.frame(height: 100)
            
            Divider()
            //            Spacer()
            
            Group {
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
                    
                    // Add Friends to List
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
            
        }
            .padding()
            .frame(width: screenSize.width * 0.8, height: screenSize.height * 0.4)
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



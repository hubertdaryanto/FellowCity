//
//  AddFriendsAlertView.swift
//  FellowCity
//
//  Created by Feri Fajri on 05/08/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct AddLocationAlertView: View {
 
    // MARK: - Variable for Dummy Data
    
    let screenSize = UIScreen.main.bounds
    @Binding var isShown: Bool
    
    var title: String = "Add Friend"
    var onAdd: (String) -> Void = { _ in }
    var onCancel: () -> Void = { }
    
    // Search Term
    @State var searchTerm: String = ""
    @Binding var locationName: String
    
//    // List All User
//    @State var allRideUser:[AllRideUser]
//    let nameArrayOfAllRideUsers = allRideUsers.map { $0.name }
    
    // List All Location
    @State var explores:[ExploreRevised]
//    let nameArrayOfAllRideUsers = explore.map { $0.name }
    
    // MARK: - Variable for Core Data
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: FriendLists.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \FriendLists.name, ascending: true)]) var myFriends: FetchedResults<FriendLists>
    

    var body: some View {
        VStack{
                Text("Choose Riding Location")
                    .font(.body)
                    .fontWeight(.bold)
            
                Text("or pick our recomended places below")
                    .font(.footnote)

//                TextField("Location Name", text: $locationName)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
            
                SearchBarList(textSearch: $searchTerm, placeholder: "Search here...")
            
            List {
                
                ForEach(self.explores.filter {
                    self.searchTerm.isEmpty ? false :
                        
//                        Using Dummy Data | self.nameArrayOfAllRideUsers.filter
                        $0.name.contains(self.searchTerm)
                        
//                        //Using CoreData | self.myFriends.filter
//                        $0.name!.contains(self.searchTerm)

                    }, id: \.self)
                { index in
                    Button(action: {
                        self.searchTerm = index.name
                    }) {
                        Text("\(index.name)")
                    }
                }
            }.frame(height: 200)
            Divider()
                HStack{
                    Spacer()
                    Button("Cancel"){
                        self.isShown = false
                        self.onCancel()
                        self.hideKeyboard()
                    }.frame(width: 80, height: 60)
                    Group {
                        Spacer()
                        Divider()
                        Spacer()
                    }
                    Button("Add"){
                        
                        self.locationName = self.searchTerm
                        self.onAdd(self.locationName)
                        
//                        // Add Friends to List in Core Data
//                        let myFriends = FriendLists(context: self.managedObjectContext)
//                        myFriends.name = "\(self.locationName)"
//                        do {
//                            try self.managedObjectContext.save()
//                        } catch {
//                            // handle the Core Data error
//                        }
                        
                        // Move Alert to Background
                        self.isShown = false
                        self.hideKeyboard()
                    }.frame(width: 80, height: 60)
                    Spacer()
                }
            
            
        }
        .padding()
        .frame(width: screenSize.width * 0.8, height: screenSize.height * 0.45)
        .background(Color("backgroundGrey").opacity(1))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .offset(y: isShown ? -60 : screenSize.height)
        .animation(.spring())
        .shadow(radius: 1, x: 1, y: 1)
        
    }
}

struct AddLocationAlertView_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationAlertView(isShown: .constant(true), locationName: .constant(""),  explores: exploreData)
    }
}



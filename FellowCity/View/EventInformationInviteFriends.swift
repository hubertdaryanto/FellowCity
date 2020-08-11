//
//  Create_Event_Invite_Friends.swift
//  Aplikasi Motor
//
//  Created by Hubert Daryanto on 26/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//
import SwiftUI


var friendList: [FriendList] = [FriendList(id: 1, name: "Alicia Puma"),
FriendList(id: 2, name: "Claude"),
FriendList(id: 3, name: "FeFa"),
FriendList(id: 4, name: "Kevin Timotius"),
FriendList(id: 5, name: "Hubert"),
FriendList(id: 6, name: "Raka Widya Prawara")]

enum FinishState {
    case notyet
    case finish
}

struct EventInformationInviteFriends: View {
    
//    @EnvironmentObject var popToHome:PopToHome
    @Binding var popToHome : Bool
    
    @State var showing : FinishState = .notyet
    
    @State private var isPublic = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
   
    @State var invitedFriends:[String] = []
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: FriendLists.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \FriendLists.name, ascending: true)]) var myFriends: FetchedResults<FriendLists>
    
    var body: some View {
//        NavigationView{
            VStack{
                HStack{
                    
                        Text("Invite Your Friends").bold().font(.title)
                        .fontWeight(.bold).foregroundColor(Color("baseColor").opacity(1)).padding(20)
 
                    
                    
                    Spacer()
                    }
//                List(friendList){ index in
//                    Text(index.name)
//                }
                
                List {
                    ForEach(friendList, id: \.self) { item in
                        MultipleSelectionRow(title: item.name, isSelected: self.invitedFriends.contains(item.name)) {
                            if self.invitedFriends.contains(item.name) {
                                self.invitedFriends.removeAll(where: { $0 == item.name })
                            }
                            else {
                                self.invitedFriends.append(item.name)
                                //                                    print(self.selectedRoute)
                            }
                        }
                    }
                }
                
                HStack{
                    VStack(alignment: .leading)
                        {
                            Text("Public Event")
                            Text("Maximum 15 people to \(eventInfo.eventName)")
                                .font(.caption)
                                .foregroundColor(Color("foregroundGrey").opacity(0.6))
                            
                    }
//                    .frame(width: 200)
                    Spacer()
                    
                    
                    Toggle(isOn: $isPublic)
                    {
                        Text("Status Ride")
                        Spacer()
                    }.labelsHidden()
                    
                }.padding()
                
//                // Tombol Finish Kanan Bawah
//                HStack{
//                    Spacer()
//                Button(action: {
//
//                    self.popToHome = false
//
//                }) {
//                    Text("Finish").foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0)).padding(20)
//                }
//                }
                
                Spacer()
            }
            
//                //End of NavigationView
            .navigationBarTitle("Invite Friends", displayMode: .inline)
        .navigationBarItems(
                trailing:
            
            HStack{
                                Spacer()
                            Button(action: {
                                
            //                self.popToHome.homeIsActive = false
                                self.popToHome = false
            //                    self.showing = .finish
            //                    self.mode.wrappedValue.dismiss()
            //                    AppView()
                            }) {
                                Text("Finish").foregroundColor(Color("baseColor").opacity(1)).padding(20)
                            }
                            }
        )
    }
}


struct EventInformationInviteFriends_Previews: PreviewProvider {
    static var previews: some View {
        EventInformationInviteFriends(popToHome: .constant(false))
    }
}

//
//  Create_Event_Invite_Friends.swift
//  Aplikasi Motor
//
//  Created by Hubert Daryanto on 26/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI



struct Create_Event_Invite_Friends: View {
    @State private var isPublic = false
     @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var friendList: [FriendList] = [FriendList(id: 1, name: "Alicia Puma"),
    FriendList(id: 2, name: "Claude"),
    FriendList(id: 3, name: "FeFa"),
    FriendList(id: 4, name: "Kevin Timotius"),
    FriendList(id: 5, name: "Hubert"),
    FriendList(id: 6, name: "Raka Widya Prawara")]
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("Invite Your Friends").bold().font(.system(size: 20, weight: .bold)).foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0)).padding(20)
                    Spacer()
                    }
                List(friendList){ index in
                    Text(index.name)
                }
                
                HStack{
                    VStack(alignment: .leading)
                        {
                            Text("Public Event")
                            Text("Maximum 15 people to \(eventInfo.eventName)")
                    }.padding(20)
                    Spacer()
                    Toggle(isOn: $isPublic)
                    {
                        Spacer()
                    }.padding()
                    
                }
                VStack{
                Button(action: {
                    eventInfo.isPublic = self.$isPublic.wrappedValue
                })
                {
                    NavigationLink(destination: MainEvent())
                    {
                       Spacer()
                        Text("Finish").foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0)).padding(20)
                    }
                    
                }
                }
                Spacer()
            }.navigationBarTitle("Event Information", displayMode: .inline).navigationBarBackButtonHidden(false)
            .navigationBarItems(leading: Button(action : {
                self.mode.wrappedValue.dismiss()
            }){
                Image(systemName: "chevron.left").foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0))
                Text("Back").foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0))
            })
        }
    }
}

struct Create_Event_Invite_Friends_Previews: PreviewProvider {
    static var previews: some View {
        Create_Event_Invite_Friends()
    }
}

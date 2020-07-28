//
//  NotificationView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 22/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import Foundation
import SwiftUI

//var music = Music()

struct NotificationView: View {
    @State var showProfileView = false
    
    @State var FriendInvitationsList = [
        FriendInvitation(name: "Claudelnr", mutualFriend: 3),
        FriendInvitation(name: "Hubert", mutualFriend: 3),
        FriendInvitation(name: "Kevin", mutualFriend: 7),
        FriendInvitation(name: "Raka", mutualFriend: 4),
        FriendInvitation(name: "Feri", mutualFriend: 5)
    ]
    
    @State var EventInvitationsList = [
        Event(name: "Claudelnr", origin: "GOP", destination: "Kalimalang"),
        Event(name: "Raka", origin: "Bekasi", destination: "VespaPark"),
        Event(name: "Kevin", origin: "Bekasi", destination: "Senayan"),
        Event(name: "Stanford", origin: "Sate Taichan", destination: "Lot 9"),
        Event(name: "Hubert", origin: "BSD", destination: "TMII"),
    ]
    
    @State var EventRequestsList = [
        Event(name: "Claudelnr", origin: "Bekasi", destination: "Kota Tua"),
        Event(name: "Hubert", origin: "BSD", destination: "Kemang"),
        Event(name: "Stanford", origin: "Bekasi", destination: "Monas"),
        Event(name: "Raka", origin: "Bekasi", destination: "Kemang"),
        Event(name: "Kevin", origin: "BSD", destination: "Bandung"),
    ]
    
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Friend Invitation")) {
                ForEach(FriendInvitationsList) { index in
                    GeometryReader { geometry in
                    HStack {
                        Image(systemName: "person.3.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .background(Color.yellow)
                        .cornerRadius(40)
                            .frame(minWidth: 0, maxWidth: geometry.size.width * 0.5 / 4, minHeight: 0, maxHeight: 50)
                        
                        ZStack {
                        NavigationLink(destination: TabFriendsView()) {
                            EmptyView()
                        }.hidden()
                            
                        VStack(alignment: .leading) {
                            Text(index.name)
                                .font(.body)
                                .fontWeight(.heavy)
                                .frame(maxWidth: 200, alignment: .leading)
                            Text("\(index.mutualFriend) Mutual Friend ")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .frame(maxWidth: 200, alignment: .leading)
                        }
                        }.frame(minWidth: 0, maxWidth: geometry.size.width * 2 / 4, minHeight: 0, maxHeight: 50, alignment: .leading)
                        
                        Spacer()
                        
                        Button(action: {
                            print("Ubah State Accept Disini")
                            self.deleteFriendInvitationsList(at:self.FriendInvitationsList.firstIndex(where: { $0.id == index.id })!)
                            
                        }){
                            Text("Accept").font(.system(size: 10)).fontWeight(.heavy)
                                .frame(minWidth: 0, maxWidth: 55, maxHeight: 30)
                                .background(Color.yellow).cornerRadius(30)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geometry.size.width * 0.75 / 4, height: 50)
                        .shadow(radius: 2, x: 1, y: 2)
                        
                        Button(action: {
                            print("Ubah State Ignore Disini")
                            self.deleteFriendInvitationsList(at:self.FriendInvitationsList.firstIndex(where: { $0.id == index.id })!)
                        })
                        {
                            Text("Ignore").font(.system(size: 10)).fontWeight(.heavy)
                                .frame(minWidth: 0, maxWidth: 55, maxHeight: 30)
                                
                                .background(Color.white)
                                .cornerRadius(30)
                                .overlay(RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.yellow, lineWidth: 1))
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geometry.size.width * 0.75 / 4, height: 50)
                        .shadow(radius: 2, x: 1, y: 2)
                    }
                    }}
                }.lineSpacing(10)
                // End of Section Friends Invitation
                
                Section(header: Text("Event Invitation")) {
                ForEach(EventInvitationsList) { index in
                    GeometryReader { geometry in
                    HStack {
                        Image(systemName: "person.3.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .background(Color.yellow)
                        .cornerRadius(40)
                            .frame(minWidth: 0, maxWidth: geometry.size.width * 0.5 / 4, minHeight: 0, maxHeight: 50)
                        
                        ZStack {
                        NavigationLink(destination: TabFriendsView()) {
                            EmptyView()
                        }.hidden()
                            
                        VStack(alignment: .leading) {
                            Text(index.name)
                                .font(.body)
                                .fontWeight(.heavy)
                                .frame(maxWidth: 200, alignment: .leading)
                            Text("\(index.origin) -> \(index.destination) ")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .frame(maxWidth: 200, alignment: .leading)
                        }
                        }.frame(minWidth: 0, maxWidth: geometry.size.width * 2 / 4, minHeight: 0, maxHeight: 50, alignment: .leading)
                        
                        Spacer()
                        
                        Button(action: {
                            print("Ubah State Accept Disini")
                            self.deleteEventInvitationsList(at:self.EventInvitationsList.firstIndex(where: { $0.id == index.id })!)
                            
                        }){
                            Text("Accept").font(.system(size: 10)).fontWeight(.heavy)
                                .frame(minWidth: 0, maxWidth: 55, maxHeight: 30)
                                .background(Color.yellow).cornerRadius(30)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geometry.size.width * 0.75 / 4, height: 50)
                        .shadow(radius: 2, x: 1, y: 2)
                        
                        Button(action: {
                            print("Ubah State Ignore Disini")
                            self.deleteEventInvitationsList(at:self.EventInvitationsList.firstIndex(where: { $0.id == index.id })!)
                        })
                        {
                            Text("Ignore").font(.system(size: 10)).fontWeight(.heavy)
                                .frame(minWidth: 0, maxWidth: 55, maxHeight: 30)
                                
                                .background(Color.white)
                                .cornerRadius(30)
                                .overlay(RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.yellow, lineWidth: 1))
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geometry.size.width * 0.75 / 4, height: 50)
                        .shadow(radius: 2, x: 1, y: 2)
                    }
                    }}
                }.lineSpacing(10)
                // End of Section Event Invitation
                
                Section(header: Text("Event Request")) {
                ForEach(EventRequestsList) { index in
                    GeometryReader { geometry in
                    HStack {
                        Image(systemName: "person.3.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .background(Color.yellow)
                        .cornerRadius(40)
                            .frame(minWidth: 0, maxWidth: geometry.size.width * 0.5 / 4, minHeight: 0, maxHeight: 50)
                        
                        ZStack {
                        NavigationLink(destination: TabFriendsView()) {
                            EmptyView()
                        }.hidden()
                            
                        VStack(alignment: .leading) {
                            Text(index.name)
                                .font(.body)
                                .fontWeight(.heavy)
                                .frame(maxWidth: 200, alignment: .leading)
                            Text("\(index.origin) -> \(index.destination) ")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .frame(maxWidth: 200, alignment: .leading)
                        }
                        }.frame(minWidth: 0, maxWidth: geometry.size.width * 2 / 4, minHeight: 0, maxHeight: 50, alignment: .leading)
                        
                        Spacer()
                        
                        Button(action: {
                            print("Ubah State Accept Disini")
                            self.deleteEventRequestsList(at:self.EventRequestsList.firstIndex(where: { $0.id == index.id })!)
                            
                        }){
                            Text("Accept").font(.system(size: 10)).fontWeight(.heavy)
                                .frame(minWidth: 0, maxWidth: 55, maxHeight: 30)
                                .background(Color.yellow).cornerRadius(30)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geometry.size.width * 0.75 / 4, height: 50)
                        .shadow(radius: 2, x: 1, y: 2)
                        
                        Button(action: {
                            print("Ubah State Ignore Disini")
                            self.deleteEventRequestsList(at:self.EventRequestsList.firstIndex(where: { $0.id == index.id })!)
                        })
                        {
                            Text("Ignore").font(.system(size: 10)).fontWeight(.heavy)
                                .frame(minWidth: 0, maxWidth: 55, maxHeight: 30)
                                
                                .background(Color.white)
                                .cornerRadius(30)
                                
                                .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.yellow, lineWidth: 1)
                                    //.shadow(radius: 2, x: 1, y: 2)
                            )
                                
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geometry.size.width * 0.75 / 4, height: 50)
                        .shadow(radius: 2, x: 1, y: 2)
                    }
                    }}
                }.lineSpacing(10)
                // End of Section Event Request
                
                
            }
            .navigationBarTitle(Text("Notification"), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.showProfileView.toggle()
                }) {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.gray, lineWidth: 2))
                }
            )
                .sheet(isPresented: $showProfileView) {
                    TabEventsView()
            }
        }
    }
    
    func deleteFriendInvitationsList(at index: Int) {
        FriendInvitationsList.remove(at: index)
    }
    
    func deleteEventInvitationsList(at index: Int) {
        EventInvitationsList.remove(at: index)
    }
    
    func deleteEventRequestsList(at index: Int) {
        EventRequestsList.remove(at: index)
    }
    
    
}



struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}


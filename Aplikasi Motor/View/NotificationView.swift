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
            
            VStack(alignment: .leading){
            Text("Friend Invitation")
                .font(.system(size: 22)).fontWeight(.bold)
                //                .font(.footnote)
                .foregroundColor(Color(hex: 0xF7BE00, alpha: 1))
                .padding()
            
            List {
                //                Section(header: Text("Friend Invitation")) {
                
                //                Section(header: HStack {
                //                                        Text("Friend Invitation")
                //                                            .font(.footnote)
                ////                                            .foregroundColor(Color(hex: 0xF7BE00, alpha: 1))
                //                                            .padding(5)
                //                //                            .clipped()
                //                                            Spacer()
                //                                    }
                ////                                    .background(Color(hex: 0x111111, alpha: 1))
                //                .background(Color.clear)
                //                                    .listRowInsets(EdgeInsets(
                //                                        top: 0,
                //                                        leading: 0,
                //                                        bottom: 0,
                //                                        trailing: 0))
                //                                    )
                //                {
                ForEach(FriendInvitationsList) { index in
                    GeometryReader { geometry in
                        HStack {
                            Image(systemName: "person.3.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 45, height: 45)
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
                                        .font(.system(size: 12))
                                        //                                .font(.body)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: 200, alignment: .leading)
                                    Text("\(index.mutualFriend) Mutual Friend ")
                                        //                                .font(.caption)
                                        .font(.system(size: 12))
                                        //                                .font(.body)
                                        .fontWeight(.light)
                                        .foregroundColor(.gray)
                                        .frame(maxWidth: 200, alignment: .leading)
                                }
                            }.frame(minWidth: 0, maxWidth: geometry.size.width * 2 / 4, minHeight: 0, maxHeight: 50, alignment: .leading)
                            
                            Spacer()
                            
                            Button(action: {
                                print("Ubah State Accept Disini")
                                self.deleteFriendInvitationsList(at:self.FriendInvitationsList.firstIndex(where: { $0.id == index.id })!)
                                
                            }){
                                Text("Accept").font(.system(size: 8)).fontWeight(.bold)
                                    .frame(minWidth: 0, maxWidth: 52, maxHeight: 18)
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
                                Text("Ignore").font(.system(size: 8)).fontWeight(.bold)
                                    .frame(minWidth: 0, maxWidth: 52, maxHeight: 18)
                                    
                                    .background(Color.white)
                                    .cornerRadius(30)
                                    .overlay(RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.yellow, lineWidth: 1))
                                
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geometry.size.width * 0.75 / 4, height: 50)
                            .shadow(radius: 2, x: 1, y: 2)
                        }
                    }
                        
                        //                }
                        .padding(.top)
                        .padding(.bottom)
                }
                }
                
                Spacer()

                
                Text("Event Invitation")
                                            .font(.system(size: 22)).fontWeight(.bold)
                                            //                .font(.footnote)
                                            .foregroundColor(Color(hex: 0xF7BE00, alpha: 1))
                                            .padding()
                                        //                Section(header: Text("Event Invitation")) {
                                        
                List{
                                        ForEach(EventInvitationsList) { index in
                                            GeometryReader { geometry in
                                                HStack {
                                                    Image(systemName: "person.3.fill")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 45, height: 45)
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
                                                                .font(.system(size: 12))
                                                                //                                .font(.body)
                                                                .fontWeight(.bold)
                                                                .frame(maxWidth: 200, alignment: .leading)
                                                            Text("\(index.origin) -> \(index.destination) ")
                                                                .font(.caption)
                                                                .font(.system(size: 12))
                                                                //                                .font(.body)
                                                                .fontWeight(.light)
                                                                .foregroundColor(.gray)
                                                                .frame(maxWidth: 200, alignment: .leading)
                                                        }
                                                    }.frame(minWidth: 0, maxWidth: geometry.size.width * 2 / 4, minHeight: 0, maxHeight: 50, alignment: .leading)
                                                    
                                                    Spacer()
                                                    
                                                    Button(action: {
                                                        print("Ubah State Accept Disini")
                                                        self.deleteEventInvitationsList(at:self.EventInvitationsList.firstIndex(where: { $0.id == index.id })!)
                                                        
                                                    }){
                                                        Text("Accept").font(.system(size: 8)).fontWeight(.bold)
                                                            .frame(minWidth: 0, maxWidth: 52, maxHeight: 18)
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
                                                        Text("Ignore").font(.system(size: 8)).fontWeight(.bold)
                                                            .frame(minWidth: 0, maxWidth: 52, maxHeight: 18)
                                                            
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
                                            .padding(.top)
                                            .padding(.bottom)
                                        
                                    }
                Spacer()
                
                Text("Event Request")
                                            .font(.system(size: 22)).fontWeight(.bold)
                                            //                .font(.footnote)
                                            .foregroundColor(Color(hex: 0xF7BE00, alpha: 1))
                                            .padding()
                                        //Section(header: Text("Event Request")) {
                List{
                                        ForEach(EventRequestsList) { index in
                                            GeometryReader { geometry in
                                                HStack {
                                                    Image(systemName: "person.3.fill")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 45, height: 45)
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
                                                                .font(.system(size: 12))
                                                                //                                .font(.body)
                                                                .fontWeight(.bold)
                                                                .frame(maxWidth: 200, alignment: .leading)
                                                            Text("\(index.origin) -> \(index.destination) ")
                                                                .font(.caption)
                                                                .font(.system(size: 12))
                                                                //                                .font(.body)
                                                                .fontWeight(.light)
                                                                .foregroundColor(.gray)
                                                                .frame(maxWidth: 200, alignment: .leading)
                                                        }
                                                    }.frame(minWidth: 0, maxWidth: geometry.size.width * 2 / 4, minHeight: 0, maxHeight: 50, alignment: .leading)
                                                    
                                                    Spacer()
                                                    
                                                    Button(action: {
                                                        print("Ubah State Accept Disini")
                                                        self.deleteEventRequestsList(at:self.EventRequestsList.firstIndex(where: { $0.id == index.id })!)
                                                        
                                                    }){
                                                        Text("Accept").font(.system(size: 8)).fontWeight(.bold)
                                                            .frame(minWidth: 0, maxWidth: 52, maxHeight: 18)
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
                                                        Text("Ignore").font(.system(size: 8)).fontWeight(.bold)
                                                            .frame(minWidth: 0, maxWidth: 52, maxHeight: 18)
                                                            
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
                                            .padding(.top)
                                            .padding(.bottom)
                //                            .lineSpacing(10)
                                    }
                
            }
            .navigationBarTitle(Text("Notification"), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.showProfileView.toggle()
                }) {
                    Image("rossi")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
//                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.gray, lineWidth: 2))
                }
            )
                .sheet(isPresented: $showProfileView) {
                    ProfileView()
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


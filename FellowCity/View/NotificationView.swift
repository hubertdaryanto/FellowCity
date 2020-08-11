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
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: FriendLists.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \FriendLists.name, ascending: true)]) var myFriends: FetchedResults<FriendLists>
    
    // List All User
    @State var allRideUser:[User]
    
    // User Setting
    @ObservedObject var userSettings = UserSettings()
    @State var FriendInvitationsList = [
        User(name: "Jonathan Cooper", imageName: "jonathan-cooper", userID: "JCooper", contact: "+6281903017483", isAvailableToRide: true, numOfRide: 10),
        User(name: "Kal Visuals", imageName: "kal-visuals", userID: "kalVee", contact: "+6281238190304", isAvailableToRide: false, numOfRide: 20),
        User(name: "Lucas Sankey", imageName: "lucas-sankey", userID: "Luckey", contact: "+628183819247894", isAvailableToRide: true, numOfRide: 20),
        User(name: "Sergio De Paula", imageName: "sergio-de-paula", userID: "SergiDP", contact: "+6281738192564", isAvailableToRide: true, numOfRide: 20)
    ]
    
    @State var EventInvitationsList = [
        Event(name: "Arshad Khan", origin: "Setu Babakan", destination: "Indonesia National Monument"),
        Event(name: "Austin Wade", origin: "Kopilot Coffee House and Kitchen", destination: "First Crack Coffee")
    ]

    
    @State var EventRequestsList = [
        Event(name: "Arshad Khan", origin: "Setu Babakan", destination: "Indonesia National Monument"),
        Event(name: "Ethan Hoover", origin: "Setu Babakan", destination: "Indonesia National Monument"),
        Event(name: "Jonathan Cooper", origin: "Setu Babakan", destination: "Indonesia National Monument")
    ]
    
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading){
                
                HStack {
                Text("Friend Invitation")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    //                .font(.footnote)
                    .foregroundColor(Color("baseColor").opacity(1))
                
                Text("(\(FriendInvitationsList.count))")
                    .font(.subheadline)
                    .foregroundColor(Color("foregroundGrey").opacity(1))
                }
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
//                                Image(systemName: "person.3.fill")
                                Image(index.imageName)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                    .overlay(RoundedRectangle(cornerRadius: 60)
                                        .stroke(Color("baseColor"), lineWidth: 2))
//                                    .frame(minWidth: 0, maxWidth: geometry.size.width * 0.5 / 4, minHeight: 0, maxHeight: 50)
                                
                                ZStack {
                                    NavigationLink(destination:
                                        
                                        FriendProfileView(name: index.name, allRideUser: allUsers)
                                    
                                    ) {
                                        EmptyView()
                                    }.hidden()
                                    
                                    VStack(alignment: .leading) {
                                        Text(index.name)
                                            .font(.system(size: 12))
                                            //                                .font(.body)
                                            .fontWeight(.bold)
                                            .frame(maxWidth: 200, alignment: .leading)
//                                        Text("\(index.mutualFriend) Mutual Friend ")
                                            Text("\(Int.random(in: 1..<10)) Mutual Friend ")
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
                                    
                                    //print("Ubah State Accept Disini")
                                    // Add Friends to List in Core Data
                                    let myFriends = FriendLists(context: self.managedObjectContext)
                                    myFriends.name = "\(index.name)"
                                    do {
                                        try self.managedObjectContext.save()
                                    } catch {
                                        // handle the Core Data error
                                    }
                                    //
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
                .onAppear { UITableView.appearance().separatorStyle = .none }
//                .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
            
                Spacer()
                Divider()
                // Event Invitation List, Tampilkan Detail Event yang dicreate oleh orang dan kita diinvite sam mereka
                HStack{
                Text("Event Invitation")
                    .font(.system(size: 22)).fontWeight(.bold)
                    //                .font(.footnote)
                    .foregroundColor(Color("baseColor").opacity(1))
                    
                    Text("(\(EventInvitationsList.count))")
                        .font(.subheadline)
                        .foregroundColor(Color("foregroundGrey").opacity(1))
                    }
                    .padding()
                //                Section(header: Text("Event Invitation")) {
                List{
                    ForEach(EventInvitationsList) { index in
                        GeometryReader { geometry in
                            HStack {
                                Image(allUsers[self.checkIndexofUser(name: index.name)].imageName)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                    .overlay(RoundedRectangle(cornerRadius: 60)
                                        .stroke(Color("baseColor"), lineWidth: 2))
                                
                                ZStack {
                                    NavigationLink(destination:
                                    
                                        EventDetailsView(isJoinShown: false, allPublicEvent: publicEvents[0])
                                    
                                    ) {
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
//                                            .fontWeight(.light)
                                            .foregroundColor(.gray)
//                                            .frame(maxWidth: 200, alignment: .leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                            
                                    }
                                }.frame(minWidth: 0, maxWidth: geometry.size.width * 2 / 4, minHeight: 0, maxHeight: 50, alignment: .leading)
                                
                                Spacer()
                                
                                Button(action: {
                                    //print("Ubah State Accept Disini")
                                    publicEvents[self.checkIndexCreatorofPublicEvent(creatorEvent: index.name)].participant.append("\(index.name)")
                                    //
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
                .onAppear { UITableView.appearance().separatorStyle = .none }
//                .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
                
                Spacer()
                
                Divider()
                // Event Request List, Tampilkan Detail User yang mau request ke Event yang kita create
                HStack{
                Text("Event Request")
                    .font(.system(size: 22)).fontWeight(.bold)
                    //                .font(.footnote)
                    .foregroundColor(Color("baseColor").opacity(1))
                    
                    Text("(\(EventRequestsList.count))")
                        .font(.subheadline)
                        .foregroundColor(Color("foregroundGrey").opacity(1))
                    }
                    .padding()
                //Section(header: Text("Event Request")) {
                List{
                    ForEach(EventRequestsList) { index in
                        GeometryReader { geometry in
                            HStack {
                                Image(allUsers[self.checkIndexofUser(name: index.name)].imageName)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .overlay(RoundedRectangle(cornerRadius: 60)
                                    .stroke(Color("baseColor"), lineWidth: 2))
                                
                                ZStack {
                                    NavigationLink(destination:
                                        
                                        FriendProfileView(name: index.name, allRideUser: allUsers)
                                        
                                        ) {
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
                                    //print("Ubah State Accept Disini")
                                    myEvents[self.checkIndexCreatorofMyEvent(creatorEvent: index.name, origin: index.origin, destination: index.destination)].participant.append("\(index.name)")
                                    //
                                    self.deleteEventRequestsList(at:self.EventRequestsList.firstIndex(where: { $0.id == index.id })!)
                                    
                                }){
                                    Text("\(myEvents[self.checkIndexCreatorofMyEvent(creatorEvent: index.name, origin: index.origin, destination: index.destination)].participant[myEvents[0].participant.count - 1])")
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
                .onAppear { UITableView.appearance().separatorStyle = .none }
//                .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
                
            }
            .navigationBarTitle(Text("Notification"), displayMode: .inline)
//            .navigationBarItems(trailing:
//                Button(action: {
//                    self.showProfileView.toggle()
//                }) {
//                    Image("\(userSettings.imageName)")
//                    .resizable()
//                    .renderingMode(.original)
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 36, height: 36)
//                    .clipShape(Circle())
//                    //                                .background(Color.white)
//                    .overlay(RoundedRectangle(cornerRadius: 36)
//                        .stroke(Color("baseColor"), lineWidth: 1))
//                    .shadow(radius: 1, x: 1, y: 1)
//                }
//            )
                .sheet(isPresented: $showProfileView) {
                    ProfileView(rideLevel: rideLevels)
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
    
    func checkIndexofUser(name : String) -> Int {
    //           let index = allRideUser.index { $0 == "\(name)" } ?? 0
            guard let index = allRideUser.firstIndex(where: { $0.name == "\(name)" })
                else { //
                return 0
            }
            return index
           }
    
    func checkIndexCreatorofPublicEvent(creatorEvent : String) -> Int {
    //           let index = allRideUser.index { $0 == "\(name)" } ?? 0
            guard let index = publicEvents.firstIndex(where: { $0.creatorEvent == "\(creatorEvent)" })
                else { //
                return 0
            }
            return index
           }
    
    func checkIndexCreatorofMyEvent(creatorEvent : String, origin : String, destination : String) -> Int {
    //           let index = allRideUser.index { $0 == "\(name)" } ?? 0
            guard let index = myEvents.firstIndex(where: { $0.creatorEvent == "\(creatorEvent)" && $0.eventMeetingPoint[0] == "\(origin)" && $0.eventDestination[0] == "\(destination)" })
                else { //
                return 0
            }
            return index
           }
    
    
}



struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(allRideUser: allUsers)
    }
}






//
//  CreateEventView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 28/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI



struct CreateEventView: View {
    // MARK: - Variable for Navigation and conditional
    @Binding var popToHome : Bool
    
    // MARK: - Variable for Dummy Data
    
    @State var eventName: String = ""
    @State var eventMeetingPoint: String = ""
    @State var eventDestinastion: String = ""
    @State var eventDate = Date()
    
    //    @State var isPresented: Bool = false
    //    @State var showProfileView = false
    @State var isMeetingPointAlert: Bool = false
    @State var isDestinationAlert: Bool = false
    @State var isShow: Bool = false
    //    @State var userID: String
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: FriendLists.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \FriendLists.name, ascending: true)]) var myFriends: FetchedResults<FriendLists>
    
    var body: some View {
        
        //                NavigationView{
        ZStack {
            VStack(alignment: .leading){
                Spacer()
                VStack(alignment: .leading){
                    HStack {
                    Image(systemName: "pencil").resizable().foregroundColor(Color(hex: 0xF7B500, alpha: 1)).frame(width: 20, height: 20, alignment: .center)
                    .shadow(radius: 1, x: 1, y: 1)
                    Text("Event Name")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
                    }
                    
                    TextField("Your Event Name...", text: $eventName, onEditingChanged: { (changed) in
                        print("Username onEditingChanged - \(changed)")
                    }) {
                        print("Username onCommit")
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    }
                Spacer()
                VStack(alignment: .leading){
                    
                    HStack {
                        Button(action: {
                            self.isMeetingPointAlert = true
                            //                        print(self.isPresented)
                            
                        })
                        {
                            Image(systemName: "magnifyingglass").resizable().foregroundColor(Color(hex: 0xF7B500, alpha: 1)).frame(width: 20, height: 20, alignment: .center)
                                .shadow(radius: 1, x: 1, y: 1)
                        }
                        
                        
                        Text("Meeting Point")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
                        
                    }
                    
                    
                    
                    TextField("Your Meeting Point...", text: $eventMeetingPoint, onEditingChanged: { (changed) in
                        print("Username onEditingChanged - \(changed)")
                    }) {
                        print("Username onCommit")
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    
                }
                Spacer()
                VStack(alignment: .leading){
                    HStack {
                    Button(action: {
                        self.isDestinationAlert = true
                        //                        print(self.isPresented)
                        
                    })
                    {
                        Image(systemName: "magnifyingglass").resizable().foregroundColor(Color(hex: 0xF7B500, alpha: 1)).frame(width: 20, height: 20, alignment: .center)
                            .shadow(radius: 1, x: 1, y: 1)
                    }
                    Text("Destination")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
                    }
                    TextField("Your Destination...", text: $eventDestinastion, onEditingChanged: { (changed) in
                        print("Username onEditingChanged - \(changed)")
                    }) {
                        print("Username onCommit")
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Spacer()
                VStack(alignment: .leading){
                    HStack {
                    Image(systemName: "calendar").resizable().foregroundColor(Color(hex: 0xF7B500, alpha: 1)).frame(width: 20, height: 20, alignment: .center)
                    .shadow(radius: 1, x: 1, y: 1)
                        
                    Text("Schedule")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
//                        .padding(.bottom)
                    }.padding(.bottom)
                    //DatePicker("", selection: $eventDate,, in: ...Date() displayedComponents: [.date, .hourAndMinute]){
                    DatePicker(selection: $eventDate, in: ...Date(), displayedComponents: [.date, .hourAndMinute]) {
                        Text("")
                    }.frame(height: 120, alignment: .center)
                }
                
                Spacer()
                //            VStack(alignment: .leading){
                //                HStack{
                //                    Spacer()
                //                    //                        NavigationLink(destination: CreateEventOptionalRouteView())
                //                    NavigationLink(destination: CreateEventOptionalRouteView(popToHome: self.$popToHome, eventDate: eventDate, eventName: eventName, eventMeetingPoint: eventMeetingPoint, eventDestinastion: eventDestinastion))
                //                    {
                //                        Text("Next")
                //                            .font(.body)
                //                            .fontWeight(.bold)
                //                            .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
                //                    }
                //                }.padding()
                //
                //            }
                
            }
            .padding()
                //End of NavigationView
                .navigationBarTitle(Text("Create Event"), displayMode: .inline)
                .navigationBarItems(
                    trailing:
                    
                    ZStack {
                        NavigationLink(
                            // MARK: - Next Page
                            destination: CreateEventOptionalRouteView(popToHome: self.$popToHome, eventDate: self.eventDate, eventName: self.eventName, eventMeetingPoint: self.eventMeetingPoint, eventDestinastion: self.eventDestinastion)
                        ){
                            
                            HStack{
                                Text("Next")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
                                
                            }
                            // End of Next Page
                        }
                        
                        
                    }
                    
            )
            Group {
            VStack{
                AddLocationAlertView(isShown: $isMeetingPointAlert, onAdd: { text in
                }, locationName: $eventMeetingPoint, explores: exploreData)
            }
            VStack{
                AddLocationAlertView(isShown: $isDestinationAlert, onAdd: { text in
                }, locationName: $eventDestinastion, explores: exploreData)
            }
            }
        }
        
        
        
    }
}

struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView(popToHome: .constant(false))
    }
}

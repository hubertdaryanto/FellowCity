//
//  ProfileView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 29/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct FriendProfileView: View {
    
    //User(name: "Fitra Eri", imageName: "fitraeri", userID: "fitrakuy", contact: "+6281235328879", isAvailableToRide: false, numOfRide: 20),
    
    @ObservedObject var userSettings = UserSettings()
    
    
    var name:String
    @State var currentLevel = 0
//    @State var name = ""
//    @State var motorcycle: String = "Yamaha YZR M1"
//    @State var userID: String = "VR46"
//    @State var contact: String = "+628178912345"
//
//    @State var isAvailable: Bool = false

    // List All User
    @State var allRideUser:[User]
    
    var body: some View {
//        NavigationView {
            ScrollView{
                Spacer()
                    VStack(alignment: .leading){
                        
    //                    Spacer()
                        
                        Group{
                        HStack{
                            Spacer()
                            ZStack{
                            Image("\(allUsers[checkIndexofUser(name: name)].imageName)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 82, height: 82)
                                .clipShape(Circle())
                                
                            Circle()
                                .frame(width: 20, height:20)
                                .offset(x: 30, y: 30)
                                .foregroundColor(allUsers[checkIndexofUser(name: name)].isAvailableToRide ? .green : .gray)
                            }
                            Spacer()
                        }
                        }
                        
                        Spacer()
                        
                        Group{
                        HStack{
                            Spacer()
                            Text("Number of Rides: \(allUsers[checkIndexofUser(name: name)].numOfRide)")
                            .font(.subheadline)
                            //                    .fontWeight(.bold)
                            .foregroundColor(Color("foregroundGrey").opacity(1))
                            Spacer()
                        }
                        }
                        
                        Spacer()
                        
                        Group{
                        VStack{
                            LevelRowView(rideLevel: rideLevels, currentLevel: checkRideLevel(numofRide: allUsers[checkIndexofUser(name: name)].numOfRide))
                        }
                        }
                        
                    }.padding(.top)
                 VStack(alignment: .leading){
                                Spacer()
                    
                    // Name
                    VStack(alignment: .leading){
                        Text("Name")
                            .font(.title)
                            //                    .fontWeight(.bold)
                            .foregroundColor(Color("baseColor").opacity(1))
                        
                        //                TextField("Your Event Name...", text: $name, onEditingChanged: { (changed) in
                        //                    print("Username onEditingChanged - \(changed)")
                        //                })
                        //                {
                        //                    print("Username onCommit")
                        //                }
                        Text("\(allUsers[checkIndexofUser(name: name)].name)")
//                        TextField("Your Display Name..." , text: $userSettings.name)
                        //                    .modifier(ClearButton(text: $name))
                        //                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Divider()
                        
                    }
                    
                    Spacer()
                    
                    Group{
                    VStack(alignment: .leading){
                        Text("ID")
                            .font(.title)
                            //                    .fontWeight(.bold)
                            .foregroundColor(Color("baseColor").opacity(1))
                        //                TextField("Your User ID...", text: $userID, onEditingChanged: { (changed) in
                        //                    print("Username onEditingChanged - \(changed)")
                        //                }) {
                        //                    print("Username onCommit")
                        //                }
                        Text("\(allUsers[checkIndexofUser(name: name)].userID)")
//                        TextField("Your User ID...", text: $userSettings.userID)
                        
                        //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        Divider()
                    }
                    }
                    
                    Spacer()
                    
                    Group{
                    VStack(alignment: .leading){
                        Text("Contact")
                            .font(.title)
                            //                    .fontWeight(.bold)
                            .foregroundColor(Color("baseColor").opacity(1))
                        //                TextField("Your Contact Number...", text: $contact, onEditingChanged: { (changed) in
                        //                    print("Username onEditingChanged - \(changed)")
                        //                }) {
                        //                    print("Username onCommit")
                        //                }
                        Text("\(allUsers[checkIndexofUser(name: name)].contact)")
//                        TextField("Your Contact Number...", text: $userSettings.contact)
                        //                .modifier(ClearButton(text: $contact))
                        //                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                        Divider()
                    }
                    }
                    
//                    VStack(alignment: .leading){
//                        Text("")
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .foregroundColor(Color("baseColor").opacity(1))
//                        HStack {
//                            VStack(alignment: .leading) {
//                                Text("Available to Ride").font(.body)
//                                Text("Allow others to invite you").font(.subheadline).foregroundColor(.gray)
//                            }
//                            Spacer()
//                            VStack {
//                                Toggle(isOn: $userSettings.isAvailableToRide) {
//                                    Text("Status Ride")
//                                    //                        self.isAvailable.toggle()
//                                }
//                                    //Change Toogle Color using HueRotation
//                                    //.hueRotation(Angle.degrees(270))
//                                    // Change Toogle color post WWDC20, ios 14
//                                    //                    .toggleStyle(SwitchToggleStyle(tint: Color.blue))
//                                    .labelsHidden()
//                            }
//                        }
//                        Divider()
//
//                    }.frame(height: 130)
                    
                }
                Spacer()
                }.padding()
            .navigationBarTitle(Text("Create Event"), displayMode: .inline)
            
//        }
        
        
    }
    
    func checkIndexofUser(name : String) -> Int {
//           let index = allRideUser.index { $0 == "\(name)" } ?? 0
        guard let index = allRideUser.firstIndex(where: { $0.name == "\(name)" })
            else { //
            return 0
        }
        return index
       }
    
    func checkRideLevel(numofRide : Int) -> Int {
        if numofRide == 0 {
            return 0
        }
        if numofRide >= 10 && numofRide < 20 {
            return  1
        }
        if numofRide >= 20 && numofRide < 30 {
            return  2
        }
        if numofRide >= 30 && numofRide < 40 {
            return  3
        }
        if numofRide >= 40 && numofRide < 50 {
            return  4
        }
        if numofRide >= 50 && numofRide < 100 {
            return  5
        }
        if numofRide >= 100 {
            return  6
        }
     return self.currentLevel
    }
    
}

struct FriendProfileView_Previews: PreviewProvider {
    static var previews: some View {
        FriendProfileView(name: "Austin Wade", allRideUser: allUsers)
    }
}





//struct ClearButton: ViewModifier{
//    @Binding var text: String
//
//    public func body(content: Content) -> some View{
//        ZStack(alignment: .trailing){
//            content
//            if !text.isEmpty
//            {
//                Button(action:
//                {
//                    self.text = ""
//                })
//                {
//                    Image(systemName: "delete.left")
//                        .foregroundColor(Color(UIColor.opaqueSeparator))
//                }
//                .padding(.trailing, 8)
//            }
//        }
//    }
//}


//public struct ClearButton: ViewModifier {
//    @Binding var text: String
//
//    public init(text: Binding<String>) {
//        self._text = text
//    }
//
//    public func body(content: Content) -> some View {
//        HStack {
//            content
//            Spacer()
//            if !text.isEmpty {
//            // onTapGesture is better than a Button here when adding to a form
//            Image(systemName: "multiply.circle.fill")
//                .foregroundColor(.secondary)
//                .opacity(text == "" ? 0 : 1)
//                .onTapGesture { self.text = "" }
//        }
//        }
//    }
//}

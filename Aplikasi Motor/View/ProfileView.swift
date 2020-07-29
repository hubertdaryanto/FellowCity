//
//  ProfileView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 29/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
//    var user:Profile
    
    @State var name = "Valentino Rossi"
    @State var motorcycle: String = "Yamaha YZR M1"
    @State var userID: String = "VR46"
    @State var password: String = "*****"
    //@State var userImage: Image
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                    Image("rossi")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 82, height: 82)
                    .clipShape(Circle())
//                    .background(Color.white)
//                    .overlay(RoundedRectangle(cornerRadius: 40)
//                        .stroke(Color.gray, lineWidth: 2))
                Spacer()
            }
//                    Spacer()
                    VStack(alignment: .leading){
                    Text("Name")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.yellow)
                    TextField("Your Event Name...", text: $name, onEditingChanged: { (changed) in
                        print("Username onEditingChanged - \(changed)")
                    }) {
                        print("Username onCommit")
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
//                    Spacer()
                    VStack(alignment: .leading){
                    Text("Motorcycle")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.yellow)
                    TextField("Your Meeting Point...", text: $motorcycle, onEditingChanged: { (changed) in
                        print("Username onEditingChanged - \(changed)")
                    }) {
                        print("Username onCommit")
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
//                    Spacer()
                   VStack(alignment: .leading){
                    Text("ID")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.yellow)
                    TextField("Your Destination...", text: $userID, onEditingChanged: { (changed) in
                        print("Username onEditingChanged - \(changed)")
                    }) {
                        print("Username onCommit")
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                   VStack(alignment: .leading){
                    Text("Password")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.yellow)
                    TextField("Your Destination...", text: $password, onEditingChanged: { (changed) in
                        print("Username onEditingChanged - \(changed)")
                    }) {
                        print("Username onCommit")
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                    
                    //Text("Date is \(eventDate, formatter: dateFormatter)")
                    Spacer()

                    
                    
                    

        //            Spacer()
                    
                }
                .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

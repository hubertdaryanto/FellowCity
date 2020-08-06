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
    // var rideLevels: [LevelGamification]
    //    @State var rideLevels: [RideLevel]
    var rideLevel: [RideLevel]
    
    @State var name = "Valentino Rossi"
    @State var motorcycle: String = "Yamaha YZR M1"
    @State var userID: String = "VR46"
    @State var contact: String = "+628178912345"
    //@State var userImage: Image
    
    @State var isAvailable: Bool = false
    
    //
    
    var body: some View {
        NavigationView {
            List{
                VStack(alignment: .leading){
                    Spacer()
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
                    //                                Spacer()
                    VStack{
                        //                Circle()
                        //                    .fill(Color.yellow)
                        //                    .frame(width: 50, height: 50)
                        //                Text("10 Rides")
                        
                        //                ScrollView {
                        //                    LevelRowView(level: listLevel)
                        //                }
                        
                        LevelRowView(rideLevel: rideLevel)
                        
                        
                        
                    }
                    
                    //            Spacer()
                    
                    // Name
                    VStack(alignment: .leading){
                        Text("Name")
                            .font(.title)
                            //                    .fontWeight(.bold)
                            .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
                        
                        //                TextField("Your Event Name...", text: $name, onEditingChanged: { (changed) in
                        //                    print("Username onEditingChanged - \(changed)")
                        //                })
                        //                {
                        //                    print("Username onCommit")
                        //                }
                        TextField("Your Display Name..." , text: $name)
                        //                    .modifier(ClearButton(text: $name))
                        //                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Divider()
                        
                    }
                    
                    
                    
                    //                    Spacer()
                    
                    //            // Motorcycle
                    //                    VStack(alignment: .leading){
                    //                    Text("Motorcycle")
                    //                        .font(.title)
                    //                        .fontWeight(.bold)
                    //                        .foregroundColor(Color.yellow)
                    //                    TextField("Your Meeting Point...", text: $motorcycle, onEditingChanged: { (changed) in
                    //                        print("Username onEditingChanged - \(changed)")
                    //                    }) {
                    //                        print("Username onCommit")
                    //                    }
                    //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    //                    }
                    ////                    Spacer()
                    
                    VStack(alignment: .leading){
                        Text("ID")
                            .font(.title)
                            //                    .fontWeight(.bold)
                            .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
                        //                TextField("Your User ID...", text: $userID, onEditingChanged: { (changed) in
                        //                    print("Username onEditingChanged - \(changed)")
                        //                }) {
                        //                    print("Username onCommit")
                        //                }
                        
                        TextField("Your User ID...", text: $userID)
                        
                        //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        Divider()
                    }
                    
                    
                    VStack(alignment: .leading){
                        Text("Contact")
                            .font(.title)
                            //                    .fontWeight(.bold)
                            .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
                        //                TextField("Your Contact Number...", text: $contact, onEditingChanged: { (changed) in
                        //                    print("Username onEditingChanged - \(changed)")
                        //                }) {
                        //                    print("Username onCommit")
                        //                }
                        TextField("Your Contact Number...", text: $contact)
                        //                .modifier(ClearButton(text: $contact))
                        //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        Divider()
                    }
                    
                    //Text("Date is \(eventDate, formatter: dateFormatter)")
                    //                    Spacer()
                    
                    VStack(alignment: .leading){
                        Text("")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Available to Ride").font(.body)
                                Text("Allow others to invite you").font(.subheadline).foregroundColor(.gray)
                            }
                            Spacer()
                            VStack {
                                Toggle(isOn: $isAvailable) {
                                    Text("Status Ride")
                                    //                        self.isAvailable.toggle()
                                }
                                    //                    .toggleStyle(SwitchToggleStyle(tint: Color.blue))
                                    
                                    .labelsHidden()
                            }
                        }
                        
                        
                        //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        Divider()
                        
                    }.frame(height: 130)
                    
                    //Text("Date is \(eventDate, formatter: dateFormatter)")
                    //            Spacer()
                    
                    
                    
                    
                    
                    //            Spacer()
                }
            }
            .navigationBarTitle(Text("Create Event"), displayMode: .inline)
        }
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(rideLevel: rideLevels)
    }
}


struct ClearButton: ViewModifier {
    @Binding var text: String
    
    public func body(content: Content) -> some View {
        HStack {
            //        ZStack(alignment: .trailing){
            content
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.secondary)
                }
                //            .padding()
                
                
            }
            
        }
        //            .padding(.trailing, 8)
        
    }
}


extension UIColor {
    convenience init(colorCode: String, alpha: Float = 1.0){
        let scanner = Scanner(string:colorCode)
        var color:UInt32 = 0;
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = CGFloat(Float(Int(color >> 16) & mask)/255.0)
        let g = CGFloat(Float(Int(color >> 8) & mask)/255.0)
        let b = CGFloat(Float(Int(color) & mask)/255.0)
        
        self.init(red: r, green: g, blue: b, alpha: CGFloat(alpha))
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

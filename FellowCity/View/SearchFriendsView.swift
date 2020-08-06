//
//  CreateVenue.swift
//  FellowCity
//
//  Created by Feri Fajri on 06/08/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct SearchFriendsView: View {
    @Environment(\.presentationMode) var presentationMode
    var names = ["Raka", "Claud", "Hubert", "Kevin", "Feri"]
    
    @State var address: String
    @State var searchTerm: String = ""
    
    @State var isHidden:Bool = false
    
    @State var showProfileView = false
    
    @State var popToHome : Bool = false
    
    var body: some View {
//        NavigationView {
        VStack{
 
                
                
                TextField("Address", text: $address)
                    //                .frame(height: 50)
                    .padding()
            
//                    ProfileView(rideLevel: rideLevels)
            
//            VStack(){
//                Spacer()
//                HStack {
//                    Spacer()
//                    ZStack {
//                        NavigationLink(
//                            destination: CreateEventView(popToHome: self.$popToHome),
//                            isActive: self.$popToHome
//                        ){
//
//                            TextField("Address", text: $address)
//
//                        }.isDetailLink(false)
//
//                    }
//                }.padding(30)
//            }
            

                                Divider()
//            }
            
            SearchBarList(textSearch: $searchTerm)
            
            List {
                
                
                
                ForEach(self.names.filter {self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)}, id: \.self) { name in
                    
                    //                                        Text(name)
                    
                    Button(action: {
                        self.address = name
//                        self.isHidden.toggle()
                    }) {
                        Text("\(name)")
                    }
                    
                }
            }.frame(height: 200)
            
            
            //            if (!self.address.isEmpty && !self.isHidden) {
            //                VStack(alignment: .leading) {
            //
            //
            //
            //                    List {
            //
            //
            ////                        SearchBar(text: $searchTerm)
            ////                        ForEach(self.names.filter {
            ////                            self.searchTerm.isEmpty ? true :
            ////                                $0.localizedCaseInsensitiveContains(self.searchTerm)
            ////                        }, id: \.self) { name in
            ////
            ////                            Text(name)
            ////                        }
            //
            //                        ForEach(
            //
            //                            0..<names.count
            //
            //
            //
            //
            //
            //                        ) { address in
            //                            Button(action: {
            //                                self.address = self.names[address]
            //                                self.isHidden.toggle()
            //                            }) {
            //                                Text("\(self.names[address])")
            //                            }
            //                        }
            //                    }
            //                    .frame(height: 200)
            //                    .opacity(isHidden ? 0 : 1)
            //                    Spacer()
            //                }
            //                .padding()
            //                .offset(y: 70)
            //                .shadow(radius: 5)
            //                .cornerRadius(5)
            //            }
            //            else {
            ////                if (!self.address.isEmpty && self.isHidden) {
            //
            //            }
            
            
            
            //            Spacer()
            }.padding()
        //        .accentColor(Color.gray)
//    }
        .navigationBarTitle(Text("Create Event"), displayMode: .inline)
}
}

struct SearchFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFriendsView(address: "")
    }
}



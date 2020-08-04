//
//  AddFriendsAlertView.swift
//  FellowCity
//
//  Created by Feri Fajri on 05/08/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct AddFriendsAlertView: View {
    
    let screenSize = UIScreen.main.bounds
    @Binding var isShown: Bool
    @Binding var userID: String
    var title: String = "Add Friend"
    var onAdd: (String) -> Void = { _ in }
    var onCancel: () -> Void = { }
    
    var body: some View {
        VStack{
//            Spacer()
            Text("Add Friend")
                .font(.body)
                .fontWeight(.bold)
            Text("Increase your riding buddies!")
            .font(.footnote)
//            .fontWeight(.bold)
//            Spacer()
            TextField("Friend ID", text: $userID)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Divider()
//            Spacer()
            
            HStack{
                Spacer()
                Button("Cancel"){
                    self.isShown = false
                    self.onCancel()
                }
                Spacer()
                Divider()
                Spacer()
                Button("Add"){
                    self.isShown = false
                    self.onAdd(self.userID)
                }
                Spacer()
            }
            
            
        }.padding()
            .frame(width: screenSize.width * 0.7, height: screenSize.height * 0.2)
            .background(Color(hex: 0xF2f2f2, alpha: 1))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .offset(y: isShown ? 0 : screenSize.height)
            .animation(.spring())
        .shadow(radius: 1, x: 1, y: 1)
        
    }
}

struct AddFriendsAlertView_Previews: PreviewProvider {
    static var previews: some View {
        AddFriendsAlertView(isShown: .constant(true), userID: .constant(""))
    }
}

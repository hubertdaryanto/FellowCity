//
//  ListParticipantView.swift
//  FellowCity
//
//  Created by Feri Fajri on 11/08/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct ListParticipantView: View {
    
    @State var allMyEventParticipant:[String]
    @State var allRideUser:[User]
    
        var body: some View {
            
            ForEach(0..<allMyEventParticipant.count) { participant in
                
            HStack{
//                Text("Index \(checkIndexofUser(userID: self.allMyEvent.participant[0] ))")
                Image("\(self.allMyEventParticipant[participant])")
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(RoundedRectangle(cornerRadius: 40)
                    .stroke(Color("baseColor"), lineWidth: 2))
//            ZStack {
//                Rectangle()
//                .foregroundColor(.white)
//    //            .background(Color.white)
//                .cornerRadius(30)
//                .overlay(RoundedRectangle(cornerRadius: 20)
//                    .stroke(Color.yellow, lineWidth: 1))
//                //Text("\(checkIndexofUser(userID: self.allMyEvent.participant[0] ))")
//
//                Text("\(self.allMyEvent.participant[0])")
//                    .font(.system(size: 14))
//                    .fontWeight(.light)
//            }.frame(width: 150, height: 100)
//                .multilineTextAlignment(.leading)
            }.frame(height: 100)
            
            }
            
        }
    
//    func checkIndexofUser(userID : String) -> Int {
//    //           let index = allRideUser.index { $0 == "\(name)" } ?? 0
//            guard let index = allRideUser.firstIndex(where: { $0.userID == "\(userID)" })
//                else { //
//                return 0
//            }
//            return index
//           }
}

struct ListParticipantView_Previews: PreviewProvider {
    static var previews: some View {
        ListParticipantView(allMyEventParticipant: myEvents[0].participant, allRideUser: allUsers)
    }
}



//
//  ExploreItemView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 27/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct ExploreItemView: View {
    
    var explore:Explore
    
    var body: some View {
        
        VStack {
            
            Image(self.explore.imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 350, height: 200)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            
            HStack {
                
                VStack(alignment: .leading, spacing: 5.0) {
                    
                    Text(self.explore.name).font(.headline).foregroundColor(.yellow)
                    Text(self.explore.province).font(.caption).foregroundColor(Color.gray)
                    
                    HStack(spacing:0){
                        
                        ForEach(0..<Int(modf(self.explore.rating).0)) { numstar in
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(Color.yellow)
                        }
                        
                        if (round(modf(self.explore.rating).1 * 2) / 2 ) == 1 {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(Color.yellow)
                        } else  {
                            Image(systemName: "star.lefthalf.fill")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(Color.yellow)
                        }
                        
                        
                        Text("(\(self.explore.reviewCount) Reviews)").font(.caption).foregroundColor(Color.gray)
                        
                    }
                    
                    Text("Maximum \(self.explore.maximumPeople) of people").font(.caption).foregroundColor(.secondary)
                }
                Spacer()
                
                Button(action: {
                    print("Ubah State Ride Disini")
                    //self.deleteEventInvitationsList(at:self.EventInvitationsList.firstIndex(where: { $0.id == index.id })!)
                }){
                    Text("Ride").font(.system(size: 10)).fontWeight(.heavy)
                        .frame(minWidth: 0, maxWidth: 55, maxHeight: 30)
                        .background(Color.yellow).cornerRadius(30)
                }
                .buttonStyle(PlainButtonStyle())
                .shadow(radius: 2, x: 1, y: 2)
            }
            .padding()
        }
    }
}



struct ExploreItemView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreItemView(explore: exploreData[0])
    }
}

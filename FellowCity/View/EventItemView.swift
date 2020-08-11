
//
//  ExploreItemView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 27/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct EventItemView: View {
    
//    var explore:ExploreRevised
    var allPublicEvent:AllEvent


    
    var body: some View {
//        ZStack {
                                NavigationLink(destination:
                                    EventDetailsView(allPublicEvent: self.allPublicEvent)
//                                    ExploreDetailsView()
                                    )
                                {
        VStack {
            
            Image(self.allPublicEvent.eventImageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 350, height: 220)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            
            HStack {
                
                VStack(alignment: .leading, spacing: 5.0) {
                    
                    Text(self.allPublicEvent.eventName).font(.system(size: 16)).bold()
                    .foregroundColor(Color("baseColor").opacity(1))
                    
                    HStack {
                    Text("@\(self.allPublicEvent.creatorEvent)").font(.system(size: 12))
                        .fontWeight(.light).foregroundColor(Color.black)
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 9, height: 9)
                        .foregroundColor(.green)
                    }
                    
                    HStack(spacing:0){
                        
                        ForEach(0..<Int(modf(self.allPublicEvent.rating).0)) { numstar in
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .foregroundColor(Color("baseColor").opacity(1))
                        }
                        
                        if (round(modf(self.allPublicEvent.rating).1 * 2) / 2 ) == 1 {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .foregroundColor(Color("baseColor").opacity(1))
                        } else  {
                            Image(systemName: "star.lefthalf.fill")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .foregroundColor(Color("baseColor").opacity(1))
                        }
                        
                        
                        Text("(\(self.allPublicEvent.review.count) Reviews)").font(.system(size: 10))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.gray).opacity(1))
                        
                    }
                    
                    Text("Maximum \(self.allPublicEvent.maximumPeople) of people").font(.caption).foregroundColor(.secondary)
                }
                Spacer()
                
//                Button(action: {
//                    print("Ubah State Ride Disini")
//                    //self.deleteEventInvitationsList(at:self.EventInvitationsList.firstIndex(where: { $0.id == index.id })!)
//                }){
                    Text("Ride").font(.system(size: 12)).fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .frame(minWidth: 0, maxWidth: 64, maxHeight: 22)
                        .background(Color("baseColor").opacity(1)).cornerRadius(30)
//                }
//                .buttonStyle(PlainButtonStyle())
                .shadow(radius: 2, x: 1, y: 2)
                
                
//                ZStack{
//                    NavigationLink(destination: CreateEventView()){
//                        EmptyView()
//                    }

                    
                
//                ZStack {
//                        NavigationLink(destination: CreateEventView())
//                        {
//                            Image(systemName: "plus.circle.fill").resizable().foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0)).frame(width: 50, height: 50, alignment: .center)
//                            .shadow(radius: 2, x: 1, y: 2)
//                        }
//
//                    }
             
                
                
//            }
            
                                    }.padding()
            
            
            
        }

        
        //.padding()
//        }
    }

    
    }
        

}
struct EventItemView_Previews: PreviewProvider {
    static var previews: some View {
        EventItemView(allPublicEvent: publicEvents[0])
    }
}

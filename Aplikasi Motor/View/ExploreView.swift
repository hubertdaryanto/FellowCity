//
//  ExploreView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 21/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import Foundation
import SwiftUI

struct ExploreView: View {
    @State var showProfileView = false
    @State private var selectedRide = 0

    @State var ExploreList = [
        ExploreLocation(name: "Vespa Park", province: "South Jakarta", rating: 4.3, reviewCount: 13, maxPeople: 20),
        ExploreLocation(name: "Kota Tua", province: "North Jakarta", rating: 4.1, reviewCount: 18, maxPeople: 40),
        ExploreLocation(name: "Taman Mini", province: "South Jakarta", rating: 4.5, reviewCount: 25, maxPeople: 50)
    ]
    
    private let rideSelection = ["Explore", "Public Events"]
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
            Picker("rideSelection", selection: $selectedRide) {
                ForEach(0 ..< rideSelection.count) { index in
                    Text(self.rideSelection[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            
            if selectedRide == 0 {
                List {
                    ForEach(ExploreList) { index in
                        //GeometryReader { geometry in
                    VStack {
                           Image(systemName: "person.3.fill")
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                
                        HStack(alignment: .center) {
                               VStack(alignment: .leading) {
                                Text(index.name).font(.headline).foregroundColor(.yellow)
                                //Spacer()
                                Text(index.province).font(.caption).foregroundColor(Color.gray)
                                //Spacer()
                                HStack(spacing:0){
                                    ForEach(0..<4) { numstar in
                                        Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                        .foregroundColor(Color.yellow)
                                    }
                                    
                                    Image(systemName: "star.lefthalf.fill")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(Color.yellow)
                                    
                                    Text("(\(index.reviewCount) Reviews)").font(.caption).foregroundColor(Color.gray)
                                
                                }
                                //Spacer()

                                Text("Maximum \(index.maxPeople) of people").font(.caption).foregroundColor(.secondary)
                               }
                            Spacer()
                               //.frame(width: geometry.size.width * 3 / 4, height: geometry.size.height / 2, alignment: .leading)
//                               ZStack {
//                               NavigationLink(destination: TabFriendsView()) {
//                                   EmptyView()
//                                }.hidden()
                                
                                Button(action: {
                                    print("Ubah State Ride Disini")
                                    //self.deleteEventInvitationsList(at:self.EventInvitationsList.firstIndex(where: { $0.id == index.id })!)
                                    
                                }){
                                    Text("Ride").font(.system(size: 10)).fontWeight(.heavy)
                                        .frame(minWidth: 0, maxWidth: 55, maxHeight: 30)
                                        .background(Color.yellow).cornerRadius(30)
                                }
                                .buttonStyle(PlainButtonStyle())
                                //.frame(width: geometry.size.width * 1 / 4, height: geometry.size.height / 2)
                                .shadow(radius: 2, x: 1, y: 2)
                            }
//                            Spacer()
                           //}//.frame(width: geometry.size.width, height: 400)
//                            }
                                                  }
                    }
                }
            } else  {
                List {
                    Text("Beep")
                    Text("\(selectedRide)")
                    Text("Selected Ride is: \(rideSelection[selectedRide])").padding()
                }
            }
            
            
        }
        .navigationBarTitle(Text("Notification"), displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: {
                self.showProfileView.toggle()
            }) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.gray, lineWidth: 2))
            }
        )
            .sheet(isPresented: $showProfileView) {
                TabEventsView()
        }
        }
        
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}

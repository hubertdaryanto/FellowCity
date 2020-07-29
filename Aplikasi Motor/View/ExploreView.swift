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
    
    var explore:Explore
    var categories:[String:[Explore]] {
        .init(
            grouping: exploreData,
            by : {$0.category.rawValue}
        )
    }
    
    
    @State var showProfileView = false
    @State private var selectedRide = 0
    
    
    private let rideSelection = ["Recommended", "Public Events"]
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                ZStack {
                
                 
                        
                Picker("rideSelection", selection: $selectedRide) {
                    ForEach(0 ..< rideSelection.count) { index in
                        Text(self.rideSelection[index])
                            .font(.system(size: 14))
                            .fontWeight(.semibold).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color(hex: 0xf7b500, alpha: 1))
                .frame(height: 28)
                        
                    
                    }
                
                if selectedRide == 0 {
//                    Text("adad")
                    List(categories.keys.sorted(), id: \String.self) { key in
                        ExploreRowView(categoryName: "\(key) Places".uppercased(), explores:
                            self.categories[key]!)
                    }
                    .frame(alignment: .leading)
                } else  {
                    List {
                        EventItemView(explore: exploreData[1])
                    }
                    //                List(categories.keys.sorted(), id: \String.self) { key in
                    //                    ExploreRowView(categoryName: "\(key) Places".uppercased(), explores:
                    //                        self.categories[key]!)
                    //                }
                }
                
                
            }
            .navigationBarTitle(Text("Ride"), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.showProfileView.toggle()
                }) {
                    Image("rossi")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
//                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.gray, lineWidth: 2))
                }
            )
                .sheet(isPresented: $showProfileView) {
                    ProfileView()
            }
        }
//    .padding()
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView(explore: exploreData[0])
    }
}










//                List {
//                    ForEach(exploreData) { index in
//                        //GeometryReader { geometry in
//                    VStack {
//                           //Image(systemName: "person.3.fill")
//
//                        Image(self.explore.imageName)
//                        .resizable()
//                            .renderingMode(.original)
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 350, height: 200)
//                            .cornerRadius(10)
//                            .shadow(radius: 5)
//
//
//                        HStack(alignment: .center) {
//                               VStack(alignment: .leading) {
//                                //Text(index.name).font(.headline).foregroundColor(.yellow)
//                                Text(self.explore.name).font(.headline).foregroundColor(.yellow)
//                                //Spacer()
//                                //Text(index.province).font(.caption).foregroundColor(Color.gray)
//                                Text(self.explore.province).font(.caption).foregroundColor(Color.gray)
//                                //Spacer()
//                                HStack(spacing:0){
//                                    ForEach(0..<4) { numstar in
//                                        Image(systemName: "star.fill")
//                                        .resizable()
//                                        .frame(width: 12, height: 12)
//                                        .foregroundColor(Color.yellow)
//                                    }
//
//                                    Image(systemName: "star.lefthalf.fill")
//                                    .resizable()
//                                    .frame(width: 12, height: 12)
//                                    .foregroundColor(Color.yellow)
//
//                                    Text("(\(self.explore.reviewCount) Reviews)").font(.caption).foregroundColor(Color.gray)
//
//                                }
//                                //Spacer()
//
//                                Text("Maximum \(self.explore.maximumPeople) of people").font(.caption).foregroundColor(.secondary)
//                               }
//                            Spacer()
//                               //.frame(width: geometry.size.width * 3 / 4, height: geometry.size.height / 2, alignment: .leading)
////                               ZStack {
////                               NavigationLink(destination: TabFriendsView()) {
////                                   EmptyView()
////                                }.hidden()
//
//                                Button(action: {
//                                    print("Ubah State Ride Disini")
//                                    //self.deleteEventInvitationsList(at:self.EventInvitationsList.firstIndex(where: { $0.id == index.id })!)
//
//                                }){
//                                    Text("Ride").font(.system(size: 10)).fontWeight(.heavy)
//                                        .frame(minWidth: 0, maxWidth: 55, maxHeight: 30)
//                                        .background(Color.yellow).cornerRadius(30)
//                                }
//                                .buttonStyle(PlainButtonStyle())
//                                //.frame(width: geometry.size.width * 1 / 4, height: geometry.size.height / 2)
//                                .shadow(radius: 2, x: 1, y: 2)
//                            }
////                            Spacer()
//                           //}//.frame(width: geometry.size.width, height: 400)
////                            }
//                                                  }
//                    }
//                }

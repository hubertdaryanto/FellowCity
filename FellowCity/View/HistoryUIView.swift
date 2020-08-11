//
//  HistoryUIView.swift
//  Aplikasi Motor
//
//  Created by Hubert Daryanto on 29/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct HistoryUIView: View {
    var history: [EventInfoHubertHistory]
    
    // User Setting
    @ObservedObject var userSettings = UserSettings()
    @State var showProfileView = false
    @State private var selectedRide = 0
    
    
    private let rideSelection = ["Recommended", "Public Event"]
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                
                ZStack {
                
                 
                        
                Picker("rideSelection", selection: $selectedRide) {
                    ForEach(0 ..< rideSelection.count) { index in
                        Text(self.rideSelection[index])
                            .fontWeight(.bold).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
//                .background(Color("baseColor"))
//                .roundedCorner(20)
                    .background(Color("baseColor").opacity(1))
                    .cornerRadius(10)
//                    .lineSpacing(16)
                    .foregroundColor(Color.black)
                    
                .padding(10)
                        
                    
                    }
                
                if selectedRide == 0 {
                    HistoryRowView(history: history, isPublic: false)
                    }
             else  {
                    EmptyView()
                    HistoryRowView(history: history, isPublic: true)
                    //                List(categories.keys.sorted(), id: \String.self) { key in
                    //                    ExploreRowView(categoryName: "\(key) Places".uppercased(), explores:
                    //                        self.categories[key]!)
                    //                }
                }
                
                
            }
            .navigationBarTitle(Text("History"), displayMode: .inline)
                        .navigationBarItems(trailing:
                            Button(action: {
                                self.showProfileView.toggle()
                            }) {
                                Image("\(userSettings.imageName)")
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 36, height: 36)
                                .clipShape(Circle())
                                //                                .background(Color.white)
                                .overlay(RoundedRectangle(cornerRadius: 36)
                                    .stroke(Color("baseColor"), lineWidth: 1))
                                .shadow(radius: 1, x: 1, y: 1)
                            }
                        )
                            .sheet(isPresented: $showProfileView) {
                                ProfileView(rideLevel: rideLevels)
                        }
        }
        
        
    }
}

struct HistoryUIView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryUIView(history: dummyHistory)
    }
}

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
                .background(Color.yellow).padding(16)
                        
                    
                    }
                
                if selectedRide == 0 {
                        HistoryRowView(history: history)
                    }
             else  {
                        HistoryRowView(history: history)
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
                    ProfileView()
            }
        }
        
        
    }
}

struct HistoryUIView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryUIView(history: dummyHistory)
    }
}

//
//  ExploreView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 20/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct AppView: View {
    
    @State private var selection = 1

    var body: some View {
        
        TabView(selection:$selection) {
            
            MainEvent()
                .tabItem {
                    Image(systemName: "flag.circle.fill")
                    Text("My Events")
            }.tag(1)
            
            TabFriendsView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Friends")
            }.tag(2)
            
            ExploreView(explore: exploreData[0])
                .tabItem {
                    Image(systemName: "arrow.right.arrow.left.circle.fill")
                    Text("Ride")
            }.tag(3)
            
            NotificationView()
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("Notification")
            }.tag(4)
            
            TabHistoryView()
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("History")
            }.tag(5)
            
        }.accentColor(Color(hex: 0xF7BE00))
    }
}


struct TabFriendsView: View {
    @State private var selectedRide = 0
    private let rideSelection = ["Explore", "Public Events"]
    var body: some View {
        FriendUIView( userID: "")
        
    }
}


struct TabHistoryView: View {
    var body: some View {
        HistoryUIView(history: dummyHistory)
    }
}



struct AppView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppView()
    }
}


/// Extension

extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}



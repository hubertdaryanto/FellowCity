//
//  LevelItemView.swift
//  FellowCity
//
//  Created by Feri Fajri on 06/08/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct LevelItemView: View {
    
    var rideLevel: RideLevel
//    var history: EventInfoHubertHistory
//    var levelGamification: [LevelGamification]
//    var explore:ExploreRevised
    
    var body: some View {
        HStack {
            VStack{
            Circle()
            //.fill(Color(hex: 0xF7B500, alpha: 1))
            .frame(width: 30, height: 30)
            
                Text("\(self.rideLevel.numOfRide) Rides")
                .font(.system(size: 15))
            //.foregroundColor(Color(hex: 0xF7B500, alpha: 1))
    
            }
            
//            Rectangle().frame(width: 60, height: 1).offset(y: -10)
            
        }
    }
}

struct LevelItemView_Previews: PreviewProvider {
    static var previews: some View {
//        LevelItemView(explore: exploreData[0])
        LevelItemView(rideLevel: rideLevels[0])
//        ExploreItemView(explore: exploreData[0])
//        HistoryItemView(history: dummyHistory[0], isPublic: false, isReviewed: false)
    }
}

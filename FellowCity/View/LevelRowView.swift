//
//  LevelRowView.swift
//  FellowCity
//
//  Created by Feri Fajri on 06/08/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct LevelRowView: View {
    
    //    var categoryName:String
    //    var rideLevels: [RideLevel]
    //    var rideLevel: RideLevel
    @State var rideLevel:[RideLevel]
    @State var currentLevel: Int
    
    @ObservedObject var userSettings = UserSettings()
    
    var body: some View {
        VStack {
            
            //                ScrollView {
            //                    ForEach (self.rideLevels, id: \.self) { rideLevel in
            //                        LevelItemView(rideLevel: rideLevel)
            //                    }
            //                }
            
            //        ScrollView(.horizontal) {
            //                             ForEach (self.rideLevel) { index in
            //
            //                                     LevelItemView(rideLevel: index)
            //
            //                             }
            //                }.frame(height: 100)
            
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                ZStack{
                    Rectangle().frame(width: 650, height: 1)
                        .offset(y: -13).foregroundColor(Color("baseColor").opacity(1))
                    HStack {
                        // multiple status view here
                        
                        
                        
                        ForEach (self.rideLevel) { index in
                            
//                            if index.level == self.currentLevel {
                            if index.level == self.currentLevel {
                                LevelItemView(rideLevel: index).foregroundColor(Color("baseColor").opacity(1))
                            } else {
                                LevelItemView(rideLevel: index).foregroundColor(Color("foregroundGrey").opacity(1))
                            }
                            
                            
                        }.frame(width: 100)
                        
                    }
                }
                
//                .padding(.leading, 10)
            }
            ).frame(height: 190)
            
            
        }
        
    }
    
    
//    func checkRideLevel(numofRide : Int) -> Int {
//        if numofRide == 0 {
//            self.currentLevel = 0
//        }
//        if numofRide >= 10 && numofRide < 20 {
//            self.currentLevel = 1
//        }
//        if numofRide >= 20 && numofRide < 30 {
//            self.currentLevel = 2
//        }
//        if numofRide >= 30 && numofRide < 40 {
//            self.currentLevel = 3
//        }
//        if numofRide >= 40 && numofRide < 50 {
//            self.currentLevel = 4
//        }
//        if numofRide >= 50 && numofRide < 100 {
//            self.currentLevel = 5
//        }
//        if numofRide >= 100 {
//            self.currentLevel = 6
//        }
//        return currentLevel
//    }
    
}

struct LevelRowView_Previews: PreviewProvider {
    static var previews: some View {
        LevelRowView(rideLevel: rideLevels, currentLevel: 5)
        //        ExploreRowView(categoryName: "Indoor", explores: exploreData)
    }
}




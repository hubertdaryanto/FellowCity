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
    @State var currentLevel: Int = 1
    
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
                    Rectangle().frame(width: 550, height: 1)
                        .offset(y: -13).foregroundColor(Color("baseColor").opacity(1))
                    HStack {
                        // multiple status view here
                        ForEach (self.rideLevel) { index in
                            
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
}

struct LevelRowView_Previews: PreviewProvider {
    static var previews: some View {
        LevelRowView(rideLevel: rideLevels)
        //        ExploreRowView(categoryName: "Indoor", explores: exploreData)
    }
}



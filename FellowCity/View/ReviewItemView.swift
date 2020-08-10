//
//  ReviewItemView.swift
//  FellowCity
//
//  Created by Feri Fajri on 11/08/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct ReviewItemView: View {
    
    var allPublicEvent:AllEvent
    
    var body: some View {
        HStack{
        ZStack {
            Rectangle()
            .foregroundColor(.white)
//            .background(Color.white)
            .cornerRadius(30)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.yellow, lineWidth: 1))
 
            Text(self.allPublicEvent.review[0])
                .font(.system(size: 14))
                .fontWeight(.light)
        }.frame(width: 150, height: 100)
            .multilineTextAlignment(.leading)
        }.frame(height: 100)
        
        
    }
}

struct ReviewItemView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewItemView(allPublicEvent: publicEvents[0])
    }
}

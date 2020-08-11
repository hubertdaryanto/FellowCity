//
//  ReviewItemView.swift
//  FellowCity
//
//  Created by Feri Fajri on 11/08/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct ReviewItemView: View {
    
    var allPublicEventReview:[String]
    
    var body: some View {
        
        ForEach(0..<allPublicEventReview.count) { review in
        
        HStack{
        ZStack {
            Rectangle()
            .foregroundColor(.white)
//            .background(Color.white)
            .cornerRadius(30)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.yellow, lineWidth: 1))
 
            Text(self.allPublicEventReview[review])
                .font(.system(size: 14))
                .fontWeight(.light)
        }.frame(width: 150, height: 100)
            .multilineTextAlignment(.leading)
        }.frame(height: 100)
        
        }
    }
}

struct ReviewItemView_Previews: PreviewProvider {
    
//    var allPublicEvent:AllEvent
    
    static var previews: some View {
        ReviewItemView(allPublicEventReview: publicEvents[0].review)
    }
}

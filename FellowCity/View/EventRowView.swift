//
//  ExploreRowView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 27/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct EventRowView: View {
    
    var categoryName:String
    var allPublicEvent:[AllEvent]
//    var allPublicEvent:AllEvent
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ScrollView {
                ForEach (self.allPublicEvent, id: \.self) { allPublicEvent in
                    EventItemView(allPublicEvent: allPublicEvent)
//                        .padding(.bottom)
                }
            }
        }
        
    }
}

struct EventRowView_Previews: PreviewProvider {
    static var previews: some View {
        EventRowView(categoryName: "Indoor", allPublicEvent: publicEvents)
    }
}

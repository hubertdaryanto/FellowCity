//
//  HistoryNonPublicEventReview.swift
//  Aplikasi Motor
//
//  Created by Hubert Daryanto on 29/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct HistoryNonPublicEventReview: View {
    var history: EventInfoHubertHistory
    var body: some View {
        VStack{
            Text(history.eventName)
            Text(formatter.string(from: history.startDate))
            history.image.resizable().frame(width: 227, height: 176, alignment: .center)
            Text("Rate your experience")
            
        }
    }
}

struct HistoryNonPublicEventReview_Previews: PreviewProvider {
    static var previews: some View {
        HistoryNonPublicEventReview(history: dummyHistory[0])
    }
}

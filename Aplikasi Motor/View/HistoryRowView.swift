//
//  HistoryRowView.swift
//  Aplikasi Motor
//
//  Created by Hubert Daryanto on 29/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct HistoryRowView: View {
    var history:[EventInfoHubertHistory]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ScrollView {
                ForEach (self.history) { index in
                    HistoryItemView(history: index)
                }
            }
        }
        
    }
}

struct HistoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryRowView(history: dummyHistory)
    }
}

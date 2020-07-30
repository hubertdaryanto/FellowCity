//
//  HistoryRowView.swift
//  Aplikasi Motor
//
//  Created by Hubert Daryanto on 29/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct HistoryRowView: View {
    @State var history:[EventInfoHubertHistory]
    @State var isPublic: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ScrollView {
                ForEach (self.history) { index in
                    if (index.isPublic == self.isPublic)
                    {
                        HistoryItemView(history: index, isPublic: self.isPublic, isReviewed: index.isReviewed)
                    }
                }
            }
        }
        
    }
}

struct HistoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryRowView(history: dummyHistory, isPublic: true)
    }
}

//
//  ExploreRowView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 27/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct ExploreRowView: View {
    
    var categoryName:String
    var explores:[Explore]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ScrollView {
                ForEach (self.explores) { explore in
                    ExploreItemView(explore: explore)
                }
            }
        }
        
    }
}

struct ExploreRowView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreRowView(categoryName: "Indoor", explores: exploreData)
    }
}

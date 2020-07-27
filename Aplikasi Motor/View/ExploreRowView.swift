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
            Text(self.categoryName).font(.title).foregroundColor(Color.yellow).fontWeight(.bold)
                .padding()
            
            ScrollView {
                //HStack(alignment: .top) {
                    ForEach (self.explores) { explore in
                    ExploreItemView(explore: explore)
                    //.frame(width: 300)
                    //.padding(.trailing, 60)
                    }
                //}
            }
        }
        
    }
}

struct ExploreRowView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreRowView(categoryName: "Indoor", explores: exploreData)
    }
}

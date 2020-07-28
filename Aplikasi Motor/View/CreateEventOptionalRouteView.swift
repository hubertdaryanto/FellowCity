//
//  CreateEventOptionalRouteView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 28/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct CreateEventOptionalRouteView: View {
    
    //@State var explores:[Explore]
    @State private var items: [Item] = (1..<6).map { Item(title: "Location #\($0)") }
    
    
     var body: some View {
            
//            NavigationView{

                VStack(alignment: .leading){
                    Spacer()
                    Text("Select Your Optional Route")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.yellow)
                    .padding()
                    
                    List {
//                        ForEach (explores) { index in
//                            //ExploreItemView(explore: explore)
//                            //ExploreItemView(explore: index)
//                           //exploreData[index]
//                        }
                        
                        ForEach(items) { item in
                            Text(item.title)
                        }
                        
                        // 1.
                        .onDelete(perform: onDelete)
                        .onMove(perform: onMove)
                    }
                    
                    
                    
                    HStack{
                                      Spacer()
                                  NavigationLink(destination: Event_Information())
                                  {
                                      Text("Next")
                                      .font(.body)
                                      .fontWeight(.bold)
                                      .foregroundColor(Color.yellow)
                                  }
                                  }.padding()
                    Spacer()
                }
                            
                            
                            
          
                            
                            
                        //End of NavigationView
//                .navigationBarTitle(Text("Create Event"), displayMode: .inline)
//                .navigationBarItems(trailing: EditButton())
//                    }
                
}
    
    
    private func onDelete(offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }


    private func onMove(source: IndexSet, destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }

    
}

struct CreateEventOptionalRouteView_Previews: PreviewProvider {
    static var previews: some View {
//        CreateEventOptionalRouteView(explores: exploreData)
        CreateEventOptionalRouteView()
    }
}

struct Item: Identifiable {
    let id = UUID()
    let title: String
}

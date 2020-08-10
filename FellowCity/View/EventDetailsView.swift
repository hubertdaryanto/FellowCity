//
//  ExploreDetailsView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 28/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//
import SwiftUI

struct EventDetailsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var explore:ExploreRevised
    
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//        VStack{
//        ExploreItemView(explore: exploreData[4])
//
//        Text("\(exploreData[4].name)")
//
//
//        }
        
        
        VStack(alignment: .leading, spacing: 5.0) {
            
            Spacer()
            
            VStack{
            Image(explore.imageName)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fill)
            .frame(height: 200)
            
//            .cornerRadius(10)
//            .shadow(radius: 5)
            }
            .padding(.bottom, 25)
            
            Spacer()
            
            VStack(alignment: .leading){
            Text(explore.name)
                .font(.system(size: 25))
                .fontWeight(.bold)
                .foregroundColor(Color("baseColor").opacity(1))
            
            Text(explore.province)
                .font(.system(size: 16))
                .fontWeight(.thin)
//                .foregroundColor(Color.gray)
            
            
            
            
            HStack(spacing:0){
                
                ForEach(0..<Int(modf(explore.rating).0)) { numstar in
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color("baseColor").opacity(1))
                }
                
                if (round(modf(explore.rating).1 * 2) / 2 ) == 1 {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color("baseColor").opacity(1))
                } else  {
                    Image(systemName: "star.lefthalf.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color("baseColor").opacity(1))
                }
                
                
                Text("(\(explore.review.count) Reviews)").font(.caption).foregroundColor(Color.gray)
                
            }
                
            }
            .padding()
            // End of headline
            
//            Spacer()
            
            VStack(alignment: .leading){
            Text("Description")
            .font(.system(size: 16))
                .fontWeight(.semibold)
            
            Text(explore.description)
             .font(.system(size: 16))
                .fontWeight(.light)
            
                Spacer()
                
            Text("Maximum People")
            .font(.system(size: 16))
            .fontWeight(.semibold)
            
            Text("\(explore.maximumPeople) people")
                .font(.system(size: 16))
                    .fontWeight(.light)
                
                Spacer()
            
            Text("Review")
            .font(.system(size: 16))
            .fontWeight(.semibold)
            
            Text("\(explore.review[0]) people")
            .font(.system(size: 16))
                .fontWeight(.light)
//            .foregroundColor(.secondary)
                
            }.padding()
            
            
            Spacer()
            
//            NavigationLink(destination:
////                CreateEventView(eventDestinastion: exploreData[1].name)
//                AppView()
////                MainEvent()
//                )
//            {
                HStack{
                    Spacer()
                    
                    Button(action: {
                        //ini buat nambahin list review ke dalam data list event / tempat tujuan
                        self.mode.wrappedValue.dismiss()
                    })
                    {
                                                                    Text("Join").foregroundColor(Color.black)
                                                .font(.system(size: 15)).fontWeight(.heavy)
                                            .frame(minWidth: 0, maxWidth: 120, maxHeight: 40)
                                            
                        //                    .background(Color.yellow)
                                            .background(Color("baseColor").opacity(1))
                                            .cornerRadius(15)
                    }

//                                            Text("Join").foregroundColor(Color.black)
//                                                .font(.system(size: 15)).fontWeight(.heavy)
//                                            .frame(minWidth: 0, maxWidth: 120, maxHeight: 40)
//
//                        //                    .background(Color.yellow)
//                                            .background(Color(hex: 0xF7B500, alpha: 1))
//                                            .cornerRadius(15)
//                    }
                    .padding()
                    


                        
                    Spacer()
                }
//            }
            
            Spacer()
        }
        
        
        
        
    }
}

struct EventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailsView(explore: exploreData[2])
    }
}

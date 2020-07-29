//
//  ExploreDetailsView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 28/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct ExploreDetailsView: View {
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
            Image(exploreData[4].imageName)
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
            Text(exploreData[4].name).font(.title)
                .fontWeight(.bold)
                .foregroundColor(.yellow)
            
            Text(exploreData[4].province)
                .font(.body)
                .foregroundColor(Color.gray)
            
            
            
            
            HStack(spacing:0){
                
                ForEach(0..<Int(modf(exploreData[4].rating).0)) { numstar in
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundColor(Color.yellow)
                }
                
                if (round(modf(exploreData[4].rating).1 * 2) / 2 ) == 1 {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundColor(Color.yellow)
                } else  {
                    Image(systemName: "star.lefthalf.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundColor(Color.yellow)
                }
                
                
                Text("(\(exploreData[4].reviewCount) Reviews)").font(.caption).foregroundColor(Color.gray)
                
            }
                
            }
            .padding()
            // End of headline
            
//            Spacer()
            
            VStack(alignment: .leading){
            Text("Description")
            .font(.subheadline)
                .fontWeight(.bold)
            .foregroundColor(Color.black)
            
            Text(exploreData[4].description)
            .font(.body)
            .foregroundColor(Color.gray)
            
                Spacer()
                
            Text("Maximum People")
            .font(.subheadline)
                .fontWeight(.bold)
            .foregroundColor(Color.black)
            
            Text("\(exploreData[4].maximumPeople) people")
                .font(.body)
                .foregroundColor(.secondary)
                
                Spacer()
            
            Text("Review")
            .font(.subheadline)
                .fontWeight(.bold)
            .foregroundColor(Color.black)
            
            Text("\(exploreData[4].review) people")
            .font(.body)
            .foregroundColor(.secondary)
                
            }.padding()
            
            
            Spacer()
            
            NavigationLink(destination: CreateEventView(eventDestinastion: exploreData[4].name))
            {
                HStack{
                    Spacer()
//                    Text("Join").foregroundColor(Color.black)
//
//                        .frame(width: 100, height: 50, alignment: .center).cornerRadius(50)
//
//                        .background(Color.yellow)
                    
                    Text("Join").foregroundColor(Color.black)
                        .font(.system(size: 15)).fontWeight(.heavy)
                    .frame(minWidth: 0, maxWidth: 120, maxHeight: 40)
                    
//                    .background(Color.yellow)
                    .background(Color(hex: 0xF7B500, alpha: 1))
                    .cornerRadius(15)
                    

                        
                    Spacer()
                }
            }
            
            Spacer()
        }
        
        
        
        
    }
}

struct ExploreDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreDetailsView()
    }
}

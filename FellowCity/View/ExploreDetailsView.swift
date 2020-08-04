//
//  ExploreDetailsView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 28/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct ExploreDetailsView: View {
    
     @State var popToHome : Bool = false
    
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
            Text(exploreData[4].name)
                .font(.system(size: 25))
                .fontWeight(.bold)
                .foregroundColor(Color(hex: 0xf7b500, alpha: 1))
            
            Text(exploreData[4].province)
                .font(.system(size: 16))
                .fontWeight(.thin)
//                .foregroundColor(Color.gray)
            
            
            
            
            HStack(spacing:0){
                
                ForEach(0..<Int(modf(exploreData[4].rating).0)) { numstar in
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color(hex: 0xf7b500, alpha: 1))
                }
                
                if (round(modf(exploreData[4].rating).1 * 2) / 2 ) == 1 {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color(hex: 0xf7b500, alpha: 1))
                } else  {
                    Image(systemName: "star.lefthalf.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color(hex: 0xf7b500, alpha: 1))
                }
                
                
                Text("(\(exploreData[4].review.count) Reviews)").font(.caption).foregroundColor(Color.gray)
                
            }
                
            }
            .padding()
            // End of headline
            
//            Spacer()
            
            VStack(alignment: .leading){
            Text("Description")
            .font(.system(size: 16))
                .fontWeight(.semibold)
            
            Text(exploreData[4].description)
             .font(.system(size: 16))
                .fontWeight(.light)
            
                Spacer()
                
            Text("Maximum People")
            .font(.system(size: 16))
            .fontWeight(.semibold)
            
            Text("\(exploreData[4].maximumPeople) people")
                .font(.system(size: 16))
                    .fontWeight(.light)
                
                Spacer()
            
            Text("Review")
            .font(.system(size: 16))
            .fontWeight(.semibold)
            
            Text("\(exploreData[4].review[0]) people")
            .font(.system(size: 16))
                .fontWeight(.light)
//            .foregroundColor(.secondary)
                
            }.padding()
            
            
            Spacer()
            
            NavigationLink(destination:
                CreateEventView(popToHome: self.$popToHome, eventDestinastion: exploreData[4].name)
                ,isActive: self.$popToHome
//                AppView()
                )
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
            }.isDetailLink(false)
            
            Spacer()
        }
        
        
        
        
    }
}

struct ExploreDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreDetailsView()
    }
}

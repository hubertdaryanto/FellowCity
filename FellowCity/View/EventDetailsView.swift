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
    
    //    var explore:ExploreRevised
    var allPublicEvent:AllEvent
    
    var body: some View {
        //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        //        VStack{
        //        ExploreItemView(explore: exploreData[4])
        //
        //        Text("\(exploreData[4].name)")
        //
        //
        //        }
        
        
        //            NavigationView{
        ScrollView {
            
            VStack(alignment: .leading, spacing: 5.0) {
                
                Spacer()
                
                VStack{
                    Image(allPublicEvent.eventImageName)
                        .resizable()
                        .renderingMode(.original)
                        .frame(height: 250)
                        .aspectRatio(contentMode: .fit)
                        
                    
                    //            .cornerRadius(10)
                    //            .shadow(radius: 5)
                }
                .padding(.top, 20)
                .padding(.bottom, 25)
                
                Spacer()
                
                VStack(alignment: .leading){
                    Text(allPublicEvent.eventName)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(Color("baseColor").opacity(1))
                    
                    Text(allPublicEvent.creatorEvent)
                        .font(.system(size: 16))
                        .fontWeight(.thin)
                    //                .foregroundColor(Color.gray)
                    
                    
                    
                    
                    HStack(spacing:0){
                        
                        ForEach(0..<Int(modf(allPublicEvent.rating).0)) { numstar in
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(Color("baseColor").opacity(1))
                        }
                        
                        if (round(modf(allPublicEvent.rating).1 * 2) / 2 ) == 1 {
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
                        
                        
                        Text("(\(allPublicEvent.review.count) Reviews)").font(.caption).foregroundColor(Color.gray)
                        
                    }
                    
                }
                .padding(.leading)
                .padding(.trailing)
                // End of headline
                
                Spacer()
                
                VStack(alignment: .leading){
                    Text("Description")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    
                    Text(allPublicEvent.description)
                        .font(.system(size: 16))
                        .fontWeight(.light)
                        .frame(height: 90)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    
                    Text("Maximum People")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    
                    Text("\(allPublicEvent.maximumPeople) people")
                        .font(.system(size: 16))
                        .fontWeight(.light)
                        .frame(height: 30)
                    Spacer()
                    
                    
                    
                    Text("Review")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
//                            ForEach(self.allPublicEvent.review, id: \.self) { review in
//                                HStack{
                                    ReviewItemView(allPublicEventReview: self.allPublicEvent.review)
//                                }
                                .frame(width: 150, height: 120)
                                
                                
//                            }
                            
                        }
                        
                    }
                    
                    //            Text("\(allPublicEvent.review[0]) people")
                    //            .font(.system(size: 16))
                    //                .fontWeight(.light)
                    ////            .foregroundColor(.secondary)
                    //            .frame(height: 85)
                    //                .multilineTextAlignment(.leading)
                    
                }
                .padding(.leading)
                .padding(.trailing)
                
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
                    
                    
                    
                    
                    
                    Spacer()
                }
                //            }
                
                Spacer()
            }
            
            
        }
            
        .navigationBarTitle(Text("Public Events"), displayMode: .inline)
        //        }
    }
}

struct EventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailsView(allPublicEvent: publicEvents[0])
    }
}

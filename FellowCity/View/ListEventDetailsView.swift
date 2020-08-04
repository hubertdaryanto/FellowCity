//
//  Event Information.swift
//  Aplikasi Motor
//
//  Created by Hubert Daryanto on 23/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//
import SwiftUI
import MapKit


struct ListEventDetailsView: View {
    @State var locationManager = CLLocationManager()
    @ObservedObject var saveRouteDetail = SaveRouteDetail()
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    
                                @State var eventDate = Date()
                                @State var eventName: String = ""
                                @State var eventMeetingPoint: String = ""
                                @State var eventDestinastion: String = ""
    
    @State var selectedRoute: [SelectedRoute] = []
    
     @State var sselectedRoute:[String] = ["Moto Village"]
    
    var body: some View {
//        NavigationView{
            VStack{
                Spacer()
                HStack{
                    VStack(alignment: .center){
                        Text("Total Distance").bold().font(.body)
                            .fontWeight(.bold).foregroundColor(Color(hex: 0xF7B500, alpha: 1)).padding(.bottom, 1)
                        //                Text("\(saveRouteDetail.totaldistance) Km")
//                        Text("\(String(format: "%.2f", saveRouteDetail.totaldistance)) Km")
                        Text("60 Km")
                    }
                    
                    CenterLine().stroke().frame(width: 100, height: 75)
                    VStack(alignment: .center)
                    {
                        Text("Estimation").bold().font(.body)
                        .fontWeight(.bold).foregroundColor(Color(hex: 0xF7B500, alpha: 1)).padding(.bottom, 1)
                        
                        
                        //                Text("\(saveRouteDetail.totaltime) Mins")
//                        Text("\(String(format: "%.2f", saveRouteDetail.totaltime)) Mins")
                        Text("66 Mins")
                    }
                }.padding()
                
                
              HStack{
                  Spacer().frame(width: 20, height: 0)
                  Text("Participants").bold().font(.body)
                  .fontWeight(.bold).foregroundColor(Color(hex: 0xF7B500, alpha: 1)).padding(.bottom, 1)
                  Spacer()
              }
                
                    VStack(alignment: .leading){
                        HStack{
                                    Image("rossi")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                    
                    Image("rossi")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                            
                            Spacer()
                    }
                        .padding(.leading)
                }
                
                HStack{
                    //                Spacer().frame(width: 20, height: 0)
                    VStack(alignment: .leading){
//                        Text(eventInfo.eventName)
                        Text(eventName).bold().font(.body)
                        .fontWeight(.bold).foregroundColor(Color(hex: 0xF7B500, alpha: 1)).padding(.bottom, 1)
//                        Text(formatter.string(from: eventInfo.startDate))
                        Text(formatter.string(from: eventDate)).font(.body)
                        .padding(.bottom, 1)
                    }
                    Spacer()
                }.padding()
                //            Spacer().frame(width: 0, height: 30)
                
                //            HStack{
                //                Spacer().frame(width: 20, height: 0)
                //                VStack(alignment: .leading){
                //                    Text("Participants").bold().font(.system(size: 20, weight: .bold)).foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0)).padding(.bottom, 1)
                //
                //                    ScrollView(.horizontal)
                //                    {
                //                        HStack{
                //                    ForEach(eventInfo.attendee){ attend in
                //                                ParticipantView(participant: attend)
                //                    }
                //                        }
                //                    }
                //
                //                }
                //            }
                Spacer()
                
                HStack{
                    Spacer().frame(width: 20, height: 0)
                    Text("Routes").bold().font(.body)
                    .fontWeight(.bold).foregroundColor(Color(hex: 0xF7B500, alpha: 1)).padding(.bottom, 1)
                    Spacer()
                }
                
                MapView(locationmanager: $locationManager, MeetingPoint: CLLocationCoordinate2D(latitude: -6.3298786, longitude: 106.9439469), LocationToBeVisited: [CLLocation(latitude: -6.3298786, longitude: 106.9439469),
                                                    CLLocation(latitude: -6.258080, longitude: 106.808391),
                                                    CLLocation(latitude: -6.2808073, longitude: 106.7122415)
                ], LocationToBeVisitedName: ["Pertamina Jatiasih", "Moto Village", "Lot 9 Bintaro"], totaltime: self.$saveRouteDetail.totaltime, totaldistance: self.$saveRouteDetail.totaldistance)
                    .padding()
                
//                List(RouteInfoDummy) { index in
//                    Text(index.place)
//                }
                
                HStack{
                    Spacer().frame(width: 20, height: 0)
                    Text("Selected Routes").bold().font(.body)
                    .fontWeight(.bold).foregroundColor(Color(hex: 0xF7B500, alpha: 1)).padding(.bottom, 1)
                    Spacer()
                }
                
                List(sselectedRoute, id:\.self) { Text($0) }
                
//                List(selectedRoute) { index in
//                    Text(index.name)
//                }
                    
                
                
//                HStack{
//                    Spacer()
//                    NavigationLink(destination: EventInformationInviteFriends())
//                    {
//                        Text("Next")
//                            .font(.body)
//                            .fontWeight(.bold)
//                            .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
//                    }
//                }.padding()
                
            }
            
                // End of Navigation View
            
//            .navigationBarTitle("Event Information", displayMode: .inline)
//            //            .navigationBarBackButtonHidden(true)
//            //            .navigationBarItems(leading: Button(action : {
//            //                self.mode.wrappedValue.dismiss()
//            //            }){
//            //                Image(systemName: "chevron.left").foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0))
//            //                Text("Back").foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0))
//            //            })
//        }
        
    }
}

struct ListEventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ListEventDetailsView(eventName: "Pertamina Jatiasih -> Lot 9 Bintaro")
    }
}



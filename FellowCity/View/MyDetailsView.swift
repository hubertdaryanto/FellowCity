//
//  Event Information.swift
//  Aplikasi Motor
//
//  Created by Hubert Daryanto on 23/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//
import SwiftUI
import MapKit


struct MyDetailsView: View {
    
    var allMyEvent:AllEvent
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }()
    
    
    @State var locationManager = CLLocationManager()
    @ObservedObject var saveRouteDetail = SaveRouteDetail()
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    
    @State var eventDate = Date()
    @State var eventName: String = ""
    @State var eventMeetingPoint: String = ""
    @State var eventDestinastion: String = ""
    
    @State var selectedRoute: [SelectedRoute] = []
    
    @State var sselectedRoute:[String] = ["Moto Village"]
    
    @State var MeetingPoint: CLLocationCoordinate2D
    @State var LocationToBeVisited: [CLLocation]
    @State var LocationToBeVisitedName: [String]
    
    var body: some View {
        //        NavigationView{
        VStack{
            Spacer()
            HStack{
                VStack(alignment: .center){
                    Text("Total Distance").bold().font(.body)
                        .fontWeight(.bold).foregroundColor(Color("baseColor").opacity(1)).padding(.bottom, 1)
                    //                Text("\(saveRouteDetail.totaldistance) Km")
                                            Text("\(String(format: "%.0f", saveRouteDetail.totaldistance)) Km")
//                    Text("60 km")
                }
                
                CenterLine().stroke().frame(width: 100, height: 75)
                VStack(alignment: .center)
                {
                    Text("Estimation").bold().font(.body)
                        .fontWeight(.bold).foregroundColor(Color("baseColor").opacity(1)).padding(.bottom, 1)
                    
                    
                    //                Text("\(saveRouteDetail.totaltime) Mins")
                                            Text("\(String(format: "%.0f", saveRouteDetail.totaltime)) Mins")
//                    Text("66 Mins")
                }
            }.padding()
            
            
            VStack{
                HStack{
                    Text("Participants").bold().font(.body)
                        .fontWeight(.bold).foregroundColor(Color("baseColor").opacity(1))
                        //                    .padding(.bottom, 10)
                        .padding(.leading)
                    Spacer()
                }
                
                VStack(alignment: .leading){
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            HStack(spacing: 10){
                                ListParticipantView(allMyEventParticipant: self.allMyEvent.participant, allRideUser: allUsers)
                            }
                            
                        }
                        
                    }
                        
                    .padding(.leading)
                }
                
            }
            
            HStack{
                //                Spacer().frame(width: 20, height: 0)
                VStack(alignment: .leading){
                    //                        Text(eventInfo.eventName)
                    Text("\(self.allMyEvent.eventName)").bold().font(.body)
                        .fontWeight(.bold).foregroundColor(Color("baseColor").opacity(1)).padding(.bottom, 1)
                        .foregroundColor(.black)
                    
                    Text("\("Pertamina Jatiasih") -> \("Lot 9 Bintaro")").font(.subheadline)
                        .foregroundColor(.black)
                        .font(.body).bold()
                    Text("\(self.dateFormatter.string(from: self.allMyEvent.eventDate))").font(.subheadline)
                        .foregroundColor(.black)
                        .font(.body)
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
                    .fontWeight(.bold).foregroundColor(Color("baseColor").opacity(1)).padding(.bottom, 1)
                Spacer()
            }
            
            
            MapView(locationmanager: $locationManager, MeetingPoint: MeetingPoint, LocationToBeVisited: LocationToBeVisited, LocationToBeVisitedName: LocationToBeVisitedName, totaltime: self.$saveRouteDetail.totaltime, totaldistance: self.$saveRouteDetail.totaldistance)
            
//            List Dummy Map
//            Meeting Point
//            name => self.allMyEvent.eventMeetingPoint[1]
//            latitude => Double(self.allMyEvent.eventMeetingPoint[1])
//            longitude => Double(self.allMyEvent.eventMeetingPoint[2])
//
//            Destination
//            name => self.allMyEvent.eventDestinastion[1]
//            latitude => Double(self.allMyEvent.eventDestinastion[1])
//            longitude => Double(self.allMyEvent.eventDestinastion[2])
//
//            Additional Routes []
//            name => self.allMyEvent.AdditionalRoutes[index][0]
//            latitude: => self.allMyEvent.AdditionalRoutes[index][1]
//            longitude: => self.allMyEvent.AdditionalRoutes[index][2]
            
            
            
            //                List(RouteInfoDummy) { index in
            //                    Text(index.place)
            //                }
            
            HStack{
                Spacer().frame(width: 20, height: 0)
                Text("Additional Routes").bold().font(.body)
                    .fontWeight(.bold).foregroundColor(Color("baseColor").opacity(1)).padding(.bottom, 1)
                Spacer()
            }
            
            VStack{
                List{
                    ForEach(0..<self.allMyEvent.AdditionalRoutes.count, id: \.self) { index in
                        Text("\(self.allMyEvent.AdditionalRoutes[index][0])")
                        
                    }
                    
                    
                    
                    
                    
                    
                }
            }
            
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
            
        }.navigationTitle("Event Detail")
        
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

struct MyDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MyDetailsView(allMyEvent: myEvents[0], eventName: "Pertamina Jatiasih -> Lot 9 Bintaro", MeetingPoint: CLLocationCoordinate2D(latitude: -6.3298786, longitude: 106.9439469), LocationToBeVisited: [CLLocation(latitude: -6.3298786, longitude: 106.9439469), CLLocation(latitude: -6.258080, longitude: 106.808391), CLLocation(latitude: -6.2808073, longitude: 106.7122415)], LocationToBeVisitedName: ["Pertamina Jatiasih", "Moto Village", "Lot 9 Bintaro"])
    }
}

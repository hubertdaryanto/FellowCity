


//
//  Event Information.swift
//  Aplikasi Motor
//
//  Created by Hubert Daryanto on 23/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//
import SwiftUI
import MapKit

struct CenterLine: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        return path
    }
}

final class SaveRouteDetail: ObservableObject{
    @Published var totaltime: Double = 0
    @Published var totaldistance: Double = 0
}

struct ParticipantView: View {
    var participant: Person
    var body: some View{
        participant.image.resizable().clipShape(Circle()).frame(width: 30, height: 30).clipped()
    }
}




var eventInfo: EventInfoHubert = EventInfoHubert(eventName: "Pertamina Jatiasih - Lot 9", startDate: formatter.date(from: "14/07/2020 7:00")!, attendee: [Person(id: 1, name: "Gratia", image: Image("fitraeri")), Person(id: 2, name: "Ken", image: Image("fitraeri"))], isPublic: false)

var RouteInfoDummy: [RouteInformation] = [RouteInformation(id: 1, place: "Pertamina Jatiasih"),
                                          RouteInformation(id: 2, place: "Kemang"),
                                          RouteInformation(id: 3, place: "Pondok Indah"),
                                          RouteInformation(id: 4, place: "Lot 9 Bintaro")]
struct Event_Information: View {
    
//    @EnvironmentObject var popToHome:PopToHome
    @Binding var popToHome : Bool
    
    @State var locationManager = CLLocationManager()
    @ObservedObject var saveRouteDetail = SaveRouteDetail()
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    
    @State var eventDate = Date()
    @State var eventName: String = ""
    @State var eventMeetingPoint: String = ""
    @State var eventDestinastion: String = ""
    
    @State var selectedRoute: [SelectedRoute] = []
    @State var MeetingPoint: CLLocationCoordinate2D
    @State var LocationToBeVisited: [CLLocation]
    @State var LocationToBeVisitedName: [String]
    
    @State var sselectedRoute:[String] = []
    
    var body: some View {
        //        NavigationView{
        VStack{
            Spacer()
            HStack{
                VStack(alignment: .center){
                    Text("Total Distance").bold().font(.body)
                        .fontWeight(.bold).foregroundColor(Color(hex: 0xF7B500, alpha: 1)).padding(.bottom, 1)
                    //                Text("\(saveRouteDetail.totaldistance) Km")
                    Text("\(String(format: "%.2f", saveRouteDetail.totaldistance)) Km")
                }
                
                CenterLine().stroke().frame(width: 100, height: 75)
                VStack(alignment: .center)
                {
                    Text("Estimation").bold().font(.body)
                        .fontWeight(.bold).foregroundColor(Color(hex: 0xF7B500, alpha: 1)).padding(.bottom, 1)
                    
                    
                    //                Text("\(saveRouteDetail.totaltime) Mins")
                    Text("\(String(format: "%.2f", saveRouteDetail.totaltime)) Mins")
                }
            }.padding()
            
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
            
//            MapView(locationmanager: $locationManager, MeetingPoint: CLLocationCoordinate2D(latitude: -6.3298786, longitude: 106.9439469), LocationToBeVisited: [CLLocation(latitude: -6.3298786, longitude: 106.9439469),
//                                                CLLocation(latitude: -6.258080, longitude: 106.808391),
//                                                CLLocation(latitude: -6.2808073, longitude: 106.7122415)
//            ], LocationToBeVisitedName: ["Pertamina Jatiasih", "Moto Village", "Lot 9 Bintaro"], totaltime: self.$saveRouteDetail.totaltime, totaldistance: self.$saveRouteDetail.totaldistance)
                MapView(locationmanager: $locationManager, MeetingPoint: MeetingPoint, LocationToBeVisited: LocationToBeVisited, LocationToBeVisitedName: LocationToBeVisitedName, totaltime: self.$saveRouteDetail.totaltime, totaldistance: self.$saveRouteDetail.totaldistance)
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
            
            VStack{
                List{
                                ForEach(sselectedRoute, id: \.self) { item in
                                    OptionalRouteViewer(title: item)
                                    {
                                        
                                    }
                                }
                                
                            }
            }
            
            
            //                List(selectedRoute) { index in
            //                    Text(index.name)
            //                }
            
            
            
            HStack{
                Spacer()
                NavigationLink(destination: EventInformationInviteFriends(popToHome: self.$popToHome))
                {
                    Text("Next")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
                }
            }.padding()
            
        }
        
        // End of Navigation View
        
                    .navigationBarTitle("Event Information", displayMode: .inline)
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

// struct Event_Information_Previews: PreviewProvider {
//     static var previews: some View {
//         Event_Information(eventName: "Pertamina Jatiasih -> Lot 9 Bintaro", MeetingPoint: CLLocationCoordinate2D(latitude: -6.3298786, longitude: 106.9439469), LocationToBeVisited: [CLLocation(latitude: -6.3298786, longitude: 106.9439469), CLLocation(latitude: -6.258080, longitude: 106.808391), CLLocation(latitude: -6.2808073, longitude: 106.7122415)], LocationToBeVisitedName: ["Pertamina Jatiasih", "Moto Village", "Lot 9 Bintaro"])
//     }
// }

struct OptionalRouteViewer: View {
    var title: String
    var action: () -> Void
    var order: Int = 0

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
            }
        }
    }
}




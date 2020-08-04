//
//  Event Information.swift
//  Aplikasi Motor
//
//  Created by Hubert Daryanto on 23/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI
import MapKit


struct Create_Event_Information: View {
    var RouteInfoDummy: [RouteInformation] = [RouteInformation(id: 1, place: "Pertamina Jatiasih"),
    RouteInformation(id: 2, place: "Kemang"),
    RouteInformation(id: 3, place: "Pondok Indah"),
    RouteInformation(id: 4, place: "Lot 9 Bintaro")]//this can be simplified
    
//    let eventInfo: EventInfo = EventInfo(eventName: "Fitra Eri", startDate: formatter.date(from: "14/07/2020 7:00")!, attendee: [Person(id: 1, name: "Gratia", image: Image("arrow.left")), Person(id: 2, name: "Ken", image: Image("arrow.left"))], isPublic: false)
    @State var locationManager = CLLocationManager()
    @ObservedObject var saveRouteDetail = SaveRouteDetail()
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView{
        VStack{
        HStack{
            VStack(alignment: .center){
                Text("Total Distance").bold().font(.system(size: 17, weight: .bold)).foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0)).padding(.bottom, 1)
                Text("\(saveRouteDetail.totaldistance) Km")
            }

            CenterLine().stroke().frame(width: 100, height: 75)
            VStack(alignment: .center)
            {
                 Text("Estimation").bold().font(.system(size: 17, weight: .bold)).foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0)).padding(.bottom, 1)
                Text("\(saveRouteDetail.totaltime) Mins")
            }
            }.padding(20)
        
            HStack{
                Spacer().frame(width: 20, height: 0)
                VStack(alignment: .leading){
                    Text(eventInfo.eventName).bold().font(.system(size: 20, weight: .bold)).foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0)).padding(.bottom, 1)
                    Text("\(formatter.string(from: eventInfo.startDate))")
                }.padding(0)
                Spacer()
            }
            Spacer().frame(width: 0, height: 30)
            HStack{
                Spacer().frame(width: 20, height: 0)
                Text("Routes").bold().font(.system(size: 20, weight: .bold)).foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0)).padding(.bottom, 1)
                Spacer()
            }
            //ini tempat buat MapKit Skip Dulu, kita buat a.k.a TableView nya dulu
            MapView(locationmanager: $locationManager, MeetingPoint: CLLocationCoordinate2D(latitude: -6.3298786, longitude: 106.9439469), LocationToBeVisited: [CLLocation(latitude: -6.3298786, longitude: 106.9439469),
                                                CLLocation(latitude: -6.258080, longitude: 106.808391),
                                                CLLocation(latitude: -6.2808073, longitude: 106.7122415)
            ], LocationToBeVisitedName: ["Pertamina Jatiasih", "Moto Village", "Lot 9 Bintaro"], totaltime: self.$saveRouteDetail.totaltime, totaldistance: self.$saveRouteDetail.totaldistance)
            List(RouteInfoDummy) { index in
                Text(index.place)
            }
            VStack{
                NavigationLink(destination:
             AppView()
                    )
            {
                Spacer()
                Text("Next").foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0)).padding(20)
            }
            }
            
            }.navigationBarTitle("Event Information", displayMode: .inline).navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.mode.wrappedValue.dismiss()
            }){
                Image(systemName: "chevron.left").foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0))
                Text("Back").foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0))
            })
        }
        
    }
}

struct Create_Event_Information_Previews: PreviewProvider {
    static var previews: some View {
        Create_Event_Information()
    }
}



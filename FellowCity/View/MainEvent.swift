

//
//  MainEvent.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 27/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//
import SwiftUI
import CoreLocation



struct MainEvent: View {
    
    // MARK: - Variable for Navigation and conditional
    @State var popToHome : Bool = false
    @State var showProfileView = false
    
   private let dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
       formatter.dateStyle = .long
       formatter.timeStyle = .short
       return formatter
   }()
    
    // MARK: - Variable for Dummy Data
    
    //User Setting
    @ObservedObject var userSettings = UserSettings()
    
    // Using Dummy List Event
    @State var allMyEvent: [AllEvent]
//    var allPublicEvent:AllEvent
    
    var attendedEventList: [AttendEventList] = [AttendEventList(id: 1, name: "Pertamina Jatiasih -> Lot 9 Bintaro", date: "04/08/2020", time: "7:00")]
    
    @State var eventDate = Date()
    @State var eventName: String = "Pertamina Jatiasih -> Lot 9 Bintaro"
    @State var eventMeetingPoint: String = "Pertamina Jatiasih"
    @State var eventDestinastion: String = "Lot 9 Bintaro"
    @State var sselectedRoute: [String] = ["Pertamina Jatiasih", "Moto Village", "Lot 9 Bintaro"]
    @State var MeetingPoint: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: -6.3298786, longitude: 106.9439469)
    @State var LocationToBeVisited: [CLLocation] = [CLLocation(latitude: -6.3298786, longitude: 106.9439469), CLLocation(latitude: -6.258080, longitude: 106.808391), CLLocation(latitude: -6.2808073, longitude: 106.7122415)]
    @State var LocationToBeVisitedName: [String] = ["Pertamina Jatiasih", "Moto Village", "Lot 9 Bintaro"]
    
    
    var body: some View {
        
        NavigationView{
            ZStack {
                Group {
                    List{
                        Section(header: HStack {
                            Text("MY EVENTS - \(myEvents.count)")
                                .font(.footnote)
                                .foregroundColor(Color("foregroundGrey").opacity(0.6))
                                .padding()
                            Spacer()
                        }
//                        .background(Color(hex: 0xF2F2F7, alpha: 1))
                            .background(Color("backgroundGrey").opacity(1))
                        .listRowInsets(EdgeInsets(top: 0,leading: 0,bottom: 0,trailing: 0))
                        ){
//                            ForEach(self.attendedEventList) { index in
                                ForEach(self.allMyEvent, id: \.self) { index in
                                    
                                ZStack{
                                    
                                    Rectangle()
                                    .frame( height: 80)
                                    .foregroundColor(Color(.white))
                                    .cornerRadius(40)
                                    .overlay(RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color("baseColor"), lineWidth: 2))
                                    .shadow(radius: 1, x: 1, y: 1)
                                    
                                    HStack{
//                                        Spacer()
                                        Image(index.eventImageName)
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                            .clipShape(Circle())
                                            .overlay(RoundedRectangle(cornerRadius: 60)
                                                .stroke(Color("baseColor"), lineWidth: 2))
//                                        Spacer()
                                        
                                        VStack(alignment: .leading){
                                            Text(index.eventName).font(.body)
                                                .foregroundColor(.black)
                                            HStack{
                                                Text("\(self.dateFormatter.string(from: index.eventDate))").font(.subheadline)
                                                    .foregroundColor(.black)
//                                                Text("-").font(.subheadline)
//                                                    .foregroundColor(.gray)
//                                                Text(index.time).font(.subheadline)
//                                                    .foregroundColor(.gray)
                                            }
                                        }
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right").resizable()
                                            .foregroundColor(Color(.black).opacity(1))
                                            .frame(width: 10, height: 10, alignment: .center)
//                                        Spacer()
                                        }
                                    .padding(15)
                                .frame(height: 80)
                                    
                                    NavigationLink(destination:
                                         //Go to EventInformationView
                                        MyDetailsView(
                                            allMyEvent: index,
                                            eventDate: self.eventDate,
                                            eventName: self.eventName,
                                            eventMeetingPoint: self.eventMeetingPoint, eventDestinastion: self.eventDestinastion, sselectedRoute: self.sselectedRoute,
                                                             MeetingPoint: self.MeetingPoint, LocationToBeVisited: self.LocationToBeVisited, LocationToBeVisitedName: self.LocationToBeVisitedName)
//
//                                        MyDetailsView(allMyEvent: myEvents, MeetingPoint: CLLocationCoordinate2D(latitude: -6.3298786, longitude: 106.9439469), LocationToBeVisited: CLLocationCoordinate2D(latitude: -6.3298786, longitude: 106.9439469), LocationToBeVisitedName: [CLLocation(latitude: -6.3298786, longitude: 106.9439469), CLLocation(latitude: -6.258080, longitude: 106.808391), CLLocation(latitude: -6.2808073, longitude: 106.7122415)])
                                        
                                    ){
                                        EmptyView()
                                    }

                                    
                                    
                                }
                                    
                                
                                
                                
                            }}}
                        .onAppear { UITableView.appearance().separatorStyle = .none }
//                        .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
                }
                // End of List Event
                Group {
                    VStack(){
                        Spacer()
                        HStack {
                            Group{
                                Spacer()
                                ZStack {
                                    NavigationLink(
                                        // MARK: - popToHome
                                        destination: CreateEventView(popToHome: self.$popToHome),
                                        isActive: self.$popToHome
                                    ){
                                        
                                        Image(systemName: "calendar.badge.plus")

                                        
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 60, height: 60)
                                            .foregroundColor(Color("baseColor").opacity(1))
                                          .shadow(radius: 1, x: 1, y: 1)
//
                                        
                                    }.isDetailLink(false)
                                    // End of popToHome
                                }
                            }
                        }.padding(30)
                    }
                }
            }
                //End of NavigationView
                
                .navigationBarTitle(Text("My Events"), displayMode: .inline)
                .navigationBarItems(
                    trailing:
                    Button(action: {
                        self.showProfileView.toggle()
                    }) {
                        Image("\(userSettings.imageName)")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())
                        //                                .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 36)
                            .stroke(Color("baseColor"), lineWidth: 2))
                        .shadow(radius: 1, x: 1, y: 1)
                    }
            )
                .sheet(isPresented: $showProfileView) {
                    ProfileView(rideLevel: rideLevels)
            }
        }
        //        .statusBar(hidden: true)
    }
    
    
}



struct MainEvent_Previews: PreviewProvider {
    static var previews: some View {
        MainEvent(allMyEvent: myEvents, MeetingPoint: CLLocationCoordinate2D(latitude: -6.3298786, longitude: 106.9439469))
        //= CLLocationCoordinate2D(latitude: -6.3298786, longitude: 106.9439469)
    }
}




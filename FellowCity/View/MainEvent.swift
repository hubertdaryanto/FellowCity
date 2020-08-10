

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
    
    
    
    // MARK: - Variable for Dummy Data
    
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
                            Text("MY EVENTS - \(self.attendedEventList.count)")
                                .font(.footnote)
                                .foregroundColor(Color(hex: 0x3c3c43, alpha: 0.6))
                                .padding()
                            Spacer()
                            
                        }
                        .background(Color(hex: 0xF2F2F7, alpha: 1))
                        .listRowInsets(EdgeInsets(top: 0,leading: 0,bottom: 0,trailing: 0))
                        ){
                            ForEach(self.attendedEventList) { index in
                                ZStack{
                                    Rectangle().fill(Color.yellow)
                                    .frame(width: UIScreen.main.bounds.width - 60, height: 80)
                                    .cornerRadius(10).shadow(color: .gray, radius: 4)
                                        .padding(10)
                                    
                                    
                                    NavigationLink(destination:
                                        // Go to EventInformationView
                                        ListEventDetailsView(eventDate: self.eventDate, eventName: self.eventName, eventMeetingPoint: self.eventMeetingPoint, eventDestinastion: self.eventDestinastion, sselectedRoute: self.sselectedRoute,
                                                             MeetingPoint: self.MeetingPoint, LocationToBeVisited: self.LocationToBeVisited, LocationToBeVisitedName: self.LocationToBeVisitedName)
                                        //
                                        
                                    )
                                    {
                                        EmptyView()
                                    }.hidden()
                                    
                                    HStack{
                                        
                                        VStack(alignment: .leading){
                                            Text(index.name).font(.headline)
                                            HStack{
                                                Text(index.date).font(.subheadline)
                                                    .foregroundColor(.gray)
                                                Text("-").font(.subheadline)
                                                    .foregroundColor(.gray)
                                                Text(index.time).font(.subheadline)
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                        Spacer()
                                        //red: 0.96484375, green: 0.7421875, blue: 0)
                                        Image(systemName: "info.circle").resizable()
                                            .foregroundColor(Color(.darkGray))
                                            .frame(width: 25, height: 25, alignment: .center)
                                    }.padding()
                                    
                        }}}}
                        .onAppear { UITableView.appearance().separatorStyle = .none }
                        .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
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
                                    
                                    Image(systemName: "plus.circle.fill").resizable().foregroundColor(Color(hex: 0xF7B500, alpha: 1)).frame(width: 58, height: 58, alignment: .center)
                                        .shadow(radius: 1, x: 1, y: 1)
                                    
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
                        Image("rossi")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                            .overlay(RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.gray, lineWidth: 2))
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
        MainEvent()
    }
}




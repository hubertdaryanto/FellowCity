

//
//  CreateEventOptionalRouteView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 28/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI
import CoreLocation

struct CreateEventOptionalRouteView: View {
    
    
    // MARK: - Variable for Navigation and conditional
    @Binding var popToHome : Bool
    //    @EnvironmentObject var popToHome:PopToHome
    
    // MARK: - Variable for Dummy Data
    
    // From Create Event
    @State var eventDate = Date()
    @State var eventName: String = ""
    @State var eventMeetingPoint: String = ""
    @State var eventDestinastion: String = ""
    
    // From Optional Route
    @State private var optionalRoute: [Item] = (0..<exploreData.count).map { Item(title: "Location #\($0)") }
    @State var selectedRoute: [SelectedRoute] = []
    @State var sselectedRoute:[String] = []
    
    // Dummy Data
    @State var MeetingPoint: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: -6.3298786, longitude: 106.9439469)
    @State var LocationToBeVisited: [CLLocation] = [CLLocation(latitude: -6.3298786, longitude: 106.9439469), CLLocation(latitude: -6.258080, longitude: 106.808391), CLLocation(latitude: -6.2808073, longitude: 106.7122415)]
    @State var LocationToBeVisitedName: [String] = ["Pertamina Jatiasih", "Moto Village", "Lot 9 Bintaro"]
    
    var body: some View {
        
        
        //            NavigationView{
        VStack(alignment: .leading){
            Spacer()
            Text("Select Your Additional Routes")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("baseColor").opacity(1))
                .padding()
            
            List {
                
                ForEach(deleteSelectedExploreData(exploreData: exploreData), id: \.self) { item in
                    MultipleSelectionRow(title: item.name, isSelected: self.sselectedRoute.contains(item.name)) {
                        if self.sselectedRoute.contains(item.name) {
                            self.sselectedRoute.removeAll(where: { $0 == item.name })
                            self.LocationToBeVisitedName.removeAll(where: { $0 == item.name })
                            
                        }
                        else {
                            if self.sselectedRoute.isEmpty
                            {
                                self.MeetingPoint = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
                                self.LocationToBeVisited.removeAll()
                                self.LocationToBeVisitedName.removeAll()
                            }
                            self.sselectedRoute.append(item.name)
                            self.LocationToBeVisited.append(CLLocation(latitude: item.latitude, longitude: item.longitude))
                            self.LocationToBeVisitedName.append(item.name)
                            //                                                                        print(self.selectedRoute)
                        }
                    }
                }
                    
                    // 1.
                    .onDelete(perform: onDelete)
                    .onMove(perform: onMove)
            }
            
            
            
//            HStack{
//                Spacer()
//                NavigationLink(destination:
//                    //                            Event_Information()
//                    EventInformationView(popToHome: self.$popToHome, eventDate: eventDate, eventName: eventName, eventMeetingPoint: eventMeetingPoint, eventDestinastion: eventDestinastion,
//                                      MeetingPoint: MeetingPoint, sselectedRoute: sselectedRoute)
//                    )
//                {
//                    Text("Next")
//                        .font(.body)
//                        .fontWeight(.bold)
//                        .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
//                }
//            }.padding()
            Spacer()
        }
            //                        End of NavigationView
            .navigationBarTitle(Text("Additional Routes"), displayMode: .inline)
        .navigationBarItems(
                trailing:
            
            ZStack {
                NavigationLink(
                     // MARK: - Next Page
                                   destination: EventInformationView(popToHome: self.$popToHome, eventDate: eventDate, eventName: eventName, eventMeetingPoint: eventMeetingPoint, eventDestinastion: eventDestinastion,
                                   MeetingPoint: MeetingPoint, sselectedRoute: sselectedRoute)
                ){
                    
                    HStack{
                    Text("Next")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(Color("baseColor").opacity(1))
                    Image(systemName: "chevron.right")
                    .foregroundColor(Color("baseColor").opacity(1))
                    
                }
                // End of Next Page
            }

                
            }
        )
        
    }
    
    func deleteSelectedExploreData(exploreData: [ExploreRevised]) -> [ExploreRevised]
    {
        var temp: [ExploreRevised] = []
        for item in exploreData{
            if item.name != eventMeetingPoint && item.name != eventDestinastion{
                temp.append(item)
            }
        }
        return temp
    }
    
    private func onDelete(offsets: IndexSet) {
        optionalRoute.remove(atOffsets: offsets)
    }
    
    
    private func onMove(source: IndexSet, destination: Int) {
        optionalRoute.move(fromOffsets: source, toOffset: destination)
    }
    
    
}

struct CreateEventOptionalRouteView_Previews: PreviewProvider {
    static var previews: some View {
        //        CreateEventOptionalRouteView(explores: exploreData)
        CreateEventOptionalRouteView(popToHome: .constant(false))
    }
}

struct Item: Identifiable {
    let id = UUID()
    let title: String
}

struct SelectedRoute: Identifiable, Equatable {
    var id = UUID()
    var name: String
}

                     // MARK: - Enable multiple selection check on List
struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    var order: Int = 0
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    
                    Spacer()
                    Image(systemName: "checkmark").foregroundColor(Color("baseColor").opacity(1))
                    //                    Text(String(order))
                }
            }
        }
    }
}


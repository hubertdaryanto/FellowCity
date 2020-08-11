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
struct EventInformationView: View {
    
//    @EnvironmentObject var popToHome:PopToHome
    @Binding var popToHome : Bool
    
    @State var locationManager = CLLocationManager()
    @ObservedObject var saveRouteDetail = SaveRouteDetail()
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    
    //FROM CreateEventView.swift
    @State var eventDate = Date()
    @State var eventName: String = ""
    @State var eventMeetingPoint: String = ""
    @State var eventDestinastion: String = ""
    
    @State var selectedRoute: [SelectedRoute] = []
    @State var MeetingPoint: CLLocationCoordinate2D
//    @State var LocationToBeVisited: [CLLocation] = get
//    @State var LocationToBeVisitedName: [String]
    
    @State var sselectedRoute:[String] = []
    
    var body: some View {
        GeometryReader{ g in
            ScrollView {
                    //        NavigationView{
                    VStack{
                        Spacer()
                        
                        HStack{
                            VStack(alignment: .center){
                                Text("Total Distance").bold().font(.body)
                                    .fontWeight(.bold).foregroundColor(Color("baseColor").opacity(1)).padding(.bottom, 1)
                                //                Text("\(saveRouteDetail.totaldistance) Km")
                                Text("\(String(format: "%.2f", self.saveRouteDetail.totaldistance)) Km")
                            }
                            
                            CenterLine().stroke().frame(width: 100, height: 75)
                            VStack(alignment: .center)
                            {
                                Text("Estimation").bold().font(.body)
                                    .fontWeight(.bold).foregroundColor(Color("baseColor").opacity(1)).padding(.bottom, 1)
                                
                                
                                //                Text("\(saveRouteDetail.totaltime) Mins")
                                Text("\(String(format: "%.2f", self.saveRouteDetail.totaltime)) Mins")
                            }
                        }.padding()
                        
                        HStack{
                            //                Spacer().frame(width: 20, height: 0)
                            VStack(alignment: .leading){
                                //                        Text(eventInfo.eventName)
                                Text(self.eventName).bold().font(.body)
                                    .fontWeight(.bold).foregroundColor(Color("baseColor").opacity(1)).padding(.bottom, 1)
                                HStack{
                                    Text(self.eventMeetingPoint).bold().font(.body).fontWeight(.bold)
                                    Image(systemName: "arrow.right")
                                    Text(self.eventDestinastion).bold().font(.body).fontWeight(.bold)
                                }
                                Text(formatter.string(from: self.eventDate)).font(.body)
                                    .padding(.bottom, 1)
                            }
                            Spacer()
                        }.padding()

                        Spacer()
                        
                        HStack{
                            Spacer().frame(width: 20, height: 0)
                            Text("Routes").bold().font(.body)
                                .fontWeight(.bold).foregroundColor(Color("baseColor").opacity(1)).padding(.bottom, 1)
                            Spacer()
                        }
                        
                        MapView(locationmanager: self.$locationManager, MeetingPoint: self.MeetingPoint, LocationToBeVisited: self.getLocationData(origin: self.eventMeetingPoint, locationName: self.sselectedRoute, destination: self.eventDestinastion).location, LocationToBeVisitedName: self.getLocationData(origin: self.eventMeetingPoint, locationName: self.sselectedRoute, destination: self.eventDestinastion).nameOfLocation, totaltime: self.$saveRouteDetail.totaltime, totaldistance: self.$saveRouteDetail.totaldistance)
                            .frame(width: g.size.width - 20, height: 400, alignment: .center)
                            .padding()
                        
                        
                        HStack{
                            Spacer().frame(width: 20, height: 0)
                            Text("Additional Routes").bold().font(.body)
                                .fontWeight(.bold).foregroundColor(Color("baseColor").opacity(1)).padding(.bottom, 1)
                            Spacer()
                        }
                        
                        VStack{
                            List{
                                ForEach(self.sselectedRoute, id: \.self) { item in
                                                OptionalRouteViewer(title: item)
                                                {}
                                                
                                }
                            }.frame(width: g.size.width - 20, height: 400, alignment: .center)
                        }
             
                        
                    }
                    
                    // End of Navigation View
                    
                                .navigationBarTitle("Event Information", displayMode: .inline)
                               .navigationBarItems(
                            trailing:
                        
                        ZStack {
                            NavigationLink(
                                 // MARK: - Next Page
                                               destination: EventInformationInviteFriends(popToHome: self.$popToHome)
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
        }
        
    }
    
    func getLocationData(origin: String, locationName: [String]?, destination: String) -> (location: [CLLocation], nameOfLocation: [String])
    {
        var temp: [ExploreRevised] = []
        var returnData: [CLLocation] = []
        var returnNameLocation: [String] = []
        for index in exploreData{
            if origin == index.name
            {
                temp.append(index)
                returnData.append(CLLocation(latitude: index.latitude, longitude: index.longitude))
                returnNameLocation.append(index.name)
            }
        }
        
        
        for index in locationName!{
            for index2 in exploreData
            {
                if index == index2.name
                {
                    temp.append(index2)
                    returnData.append(CLLocation(latitude: index2.latitude, longitude: index2.longitude))
                    returnNameLocation.append(index2.name)
                }
            }
        }
        
        for index in exploreData{
            if destination == index.name
            {
                temp.append(index)
                returnData.append(CLLocation(latitude: index.latitude, longitude: index.longitude))
                returnNameLocation.append(index.name)
            }
        }
        return (returnData, returnNameLocation)
    }
}


//get ordering array of struct method from https://stackoverflow.com/questions/43056807/sorting-a-swift-array-by-ordering-from-another-array
protocol Reorderable {
    associatedtype OrderElement: Equatable
    var orderElement: OrderElement { get }
}

extension Array where Element: Reorderable {

    func reorder(by preferredOrder: [Element.OrderElement]) -> [Element] {
        sorted {
            guard let first = preferredOrder.firstIndex(of: $0.orderElement) else {
                return false
            }

            guard let second = preferredOrder.firstIndex(of: $1.orderElement) else {
                return true
            }

            return first < second
        }
    }
}

extension ExploreRevised: Reorderable {
    typealias OrderElement = String
    var orderElement: OrderElement { name }
}

//EOF
// struct Event_Information_Previews: PreviewProvider {
//     static var previews: some View {
//        EventInformationView(popToHome: true, eventName: "Pertamina Jatiasih -> Lot 9 Bintaro", MeetingPoint: CLLocationCoordinate2D(latitude: -6.3298786, longitude: 106.9439469), LocationToBeVisited: [CLLocation(latitude: -6.3298786, longitude: 106.9439469), CLLocation(latitude: -6.258080, longitude: 106.808391), CLLocation(latitude: -6.2808073, longitude: 106.7122415)], LocationToBeVisitedName: ["Pertamina Jatiasih", "Moto Village", "Lot 9 Bintaro"])
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

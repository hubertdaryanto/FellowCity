


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
var formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.timeZone = .current
    formatter.locale = .current
    formatter.dateFormat = "dd/MM/yyyy h:mm"
    return formatter
}()



var eventInfo: EventInfoHubert = EventInfoHubert(eventName: "Pertamina Jatiasih - Lot 9", startDate: formatter.date(from: "14/07/2020 7:00")!, attendee: [Person(id: 1, name: "Gratia", image: Image("fitraeri")), Person(id: 2, name: "Ken", image: Image("fitraeri"))], isPublic: false)

var RouteInfoDummy: [RouteInformation] = [RouteInformation(id: 1, place: "Pertamina Jatiasih"),
                                          RouteInformation(id: 2, place: "Kemang"),
                                          RouteInformation(id: 3, place: "Pondok Indah"),
                                          RouteInformation(id: 4, place: "Lot 9 Bintaro")]
struct Event_Information: View {
    @State var locationManager = CLLocationManager()
    @ObservedObject var saveRouteDetail = SaveRouteDetail()
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    
    @State var eventDate = Date()
    @State var eventName: String = ""
    @State var eventMeetingPoint: String = ""
    @State var eventDestinastion: String = ""
    
    @State var selectedRoute: [SelectedRoute] = []
    
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
            
            MapView(locationmanager: $locationManager, totaltime: self.$saveRouteDetail.totaltime, totaldistance: self.$saveRouteDetail.totaldistance)
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
            
            
            
            HStack{
                Spacer()
                NavigationLink(destination: EventInformationInviteFriends())
                {
                    Text("Next")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
                }
            }.padding()
            
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

struct Event_Information_Previews: PreviewProvider {
    static var previews: some View {
        Event_Information(eventName: "Pertamina Jatiasih -> Lot 9 Bintaro")
    }
}

struct MapView: UIViewRepresentable {
    @Binding var locationmanager: CLLocationManager
    
    @Binding var totaltime: Double
    @Binding var totaldistance: Double
    
    let region = MKCoordinateRegion.init(center: CLLocationCoordinate2D(latitude: -6.3298786, longitude: 106.9439469), latitudinalMeters: 10000, longitudinalMeters: 10000)
    let dummylocations: [CLLocation] = [CLLocation(latitude: -6.3298786, longitude: 106.9439469),
                                        CLLocation(latitude: -6.258080, longitude: 106.808391),
                                        CLLocation(latitude: -6.2808073, longitude: 106.7122415)
    ]
    let nameOfLocation: [String] = ["Pertamina Jatiasih", "Moto Village", "Lot 9 Bintaro"]
    
    func makeCoordinator() -> MapController {
        MapController(parent1: self)
    }
    
    func makeUIView(context: Context) -> MKMapView
    {
        let mapView = MKMapView()
        var distance: CLLocationDistance = 0
        var time: CLLocationDistance = 0
        //        var totaldistance: Double = 0
        //        var totaltime: Double = 0
        //        var previousLocation: CLLocation?
        mapView.delegate = context.coordinator
        mapView.setRegion(region, animated: true)
        mapView.mapType = MKMapType.standard
        mapView.showsTraffic = true
        func getCenterLocation(for mapView: MKMapView) -> CLLocation {
            let latitude = mapView.centerCoordinate.latitude
            let longitude = mapView.centerCoordinate.longitude
            return CLLocation(latitude: latitude, longitude: longitude)
        }
        
        func getTotalEstimationTimeAndDistance(location: [CLLocation], nameOfLocation: [String])
        {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: location[0].coordinate.latitude, longitude: location[0].coordinate.longitude)
            annotation.title = nameOfLocation[0]
            mapView.addAnnotation(annotation)
            for i in 0...location.count - 2{
                getDirections(from: location[i], to: location[i+1], nameOfLocation: nameOfLocation[i+1])
                
            }
        }
        
        func getDirections(from: CLLocation, to: CLLocation, nameOfLocation: String)
        {
            
            let request = createDirectionsRequest(from: from, to: to)
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: to.coordinate.latitude, longitude: to.coordinate.longitude)
            annotation.title = nameOfLocation
            mapView.addAnnotation(annotation)
            let directions = MKDirections(request: request)
            
            directions.calculate{
                (response, error) in
                //handle error if needed
                guard let response = response else { return }//show response not available in an alert
                
                for route in response.routes {
                    if route.advisoryNotices .isEmpty
                    {
                        mapView.addOverlay(route.polyline, level: .aboveRoads)
                        mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                        distance = route.distance
                        time = route.expectedTravelTime
                        
                        self.totaldistance +=  distance
                        self.totaltime +=  time
                    }
                }
                self.totaldistance = self.totaldistance / 1000
                self.totaltime = self.totaltime / 60
                
                //                 distanceLabel.text = "\( totaldistance / 1000) km"
                //                 timeLabel.text = "\( totaltime / 60) minutes"
            }
        }
        
        func createDirectionsRequest(from: CLLocation, to: CLLocation) -> MKDirections.Request {
            let startingLocation = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: from.coordinate.latitude, longitude: from.coordinate.longitude))
            let destination = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: to.coordinate.latitude, longitude: to.coordinate.longitude))
            
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: startingLocation)
            request.destination = MKMapItem(placemark: destination)
            request.transportType = .automobile
            request.requestsAlternateRoutes = true
            return request
        }
        //        previousLocation = getCenterLocation(for: mapView)
        getTotalEstimationTimeAndDistance(location: dummylocations, nameOfLocation: nameOfLocation)
        
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
    }
    
    class MapController: NSObject, CLLocationManagerDelegate, MKMapViewDelegate{
        var parent: MapView
        
        init(parent1: MapView){
            parent = parent1
        }
        
        
        
        //        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        //            let center = getCenterLocation(for: mapView)
        //            let geoCoder = CLGeocoder()
        //
        //            guard let previousLocation = self.previousLocation else { return }
        //
        //            guard center.distance(from: previousLocation) > 50 else { return }
        //            self.previousLocation = center
        //
        //        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
            renderer.strokeColor = .blue
            
            return renderer
        }
    }
}




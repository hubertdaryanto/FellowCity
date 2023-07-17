//
//  MapView.swift
//  FellowCity
//
//  Created by Hubert Daryanto on 03/08/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import Foundation
import MapKit
import SwiftUI


var routeCategory: Int = 0
var totaldata = 0

struct LocationData{
    var coordinate: CLLocation
    var nameOfLocation: String
}

struct MapView: UIViewRepresentable {
    @Binding var locationmanager: CLLocationManager
    
    @State var MeetingPoint: CLLocationCoordinate2D
    @State var LocationToBeVisited: [CLLocation]
    @State var LocationToBeVisitedName: [String]
    
    @Binding var totaltime: Double
    @Binding var totaldistance: Double
    
    @State private var isDirected = false
    
    func makeCoordinator() -> MapController {
        MapController(parent1: self)
    }
    
    func makeUIView(context: Context) -> MKMapView
    {
        self.totaltime = 0
        self.totaldistance = 0
        totaldata = LocationToBeVisited.count
        let region = MKCoordinateRegion.init(center: MeetingPoint, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        let dummylocations: [CLLocation] = LocationToBeVisited
        
        let nameOfLocation: [String] = LocationToBeVisitedName
        let mapView = MKMapView()
        var distance: CLLocationDistance = 0
        var time: CLLocationDistance = 0
        var locationCount: Int = 1
        mapView.delegate = context.coordinator
        mapView.setRegion(region, animated: true)
        mapView.mapType = MKMapType.standard
        mapView.showsTraffic = true
        func getCenterLocation(for mapView: MKMapView) -> CLLocation {
            let latitude = mapView.centerCoordinate.latitude
            let longitude = mapView.centerCoordinate.longitude
            return CLLocation(latitude: latitude, longitude: longitude)
        }
        
        //sediakan at least 3 warna untuk membedakan start point, additional point, dan finish point
        //red = start
        //green = additional
//        //blue = finish
//        let colorCollection: [UIColor] = [.red, .green, .blue]
        func getTotalEstimationTimeAndDistance(location: [CLLocation], nameOfLocation: [String])
        {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: location[0].coordinate.latitude, longitude: location[0].coordinate.longitude)
            annotation.title = "1. " + nameOfLocation[0]
            mapView.addAnnotation(annotation)
            for i in 0...location.count - 2{
                locationCount += 1
                getDirections(from: LocationData(coordinate: location[i], nameOfLocation: nameOfLocation[i]), to: LocationData(coordinate: location[i+1], nameOfLocation: nameOfLocation[i+1]))
                
            }
        }
        
        func getDirections(from: LocationData, to: LocationData)
        {
            
            let request = createDirectionsRequest(from: from, to: to)
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: to.coordinate.coordinate.latitude, longitude: to.coordinate.coordinate.longitude)
            annotation.title = "\(locationCount). " + to.nameOfLocation
            mapView.addAnnotation(annotation)
            let directions = MKDirections(request: request)
            directions.calculate{
                (response, error) in
                //handle error if needed
                guard let response = response else { return }//show response not available in an alert
                self.isDirected = false
                for route in response.routes {
//                    if route.advisoryNotices .isEmpty
//                    {
                        if !self.isDirected
                        {
                            
                            if  response.source.name == self.LocationToBeVisitedName.first && self.LocationToBeVisitedName.count > 2
                            {
                                let polyline = StartOverlay(points: route.polyline.points(), count: route.polyline.pointCount)
                                mapView.addOverlay(polyline, level: .aboveRoads)
                                mapView.setVisibleMapRect(polyline.boundingMapRect, animated: true)
                                
                            }
                            else if response.destination.name == self.LocationToBeVisitedName.last {
                                let polyline = FinishOverlay(points: route.polyline.points(), count: route.polyline.pointCount)
                                mapView.addOverlay(polyline, level: .aboveRoads)
                                mapView.setVisibleMapRect(polyline.boundingMapRect, animated: true)
                            }
                            else {
                                let polyline = AdditionalOverlay(points: route.polyline.points(), count: route.polyline.pointCount)
                                                              mapView.addOverlay(polyline, level: .aboveRoads)
                                                              mapView.setVisibleMapRect(polyline.boundingMapRect, animated: true)
                            }
                            
                            distance = route.distance
                            time = route.expectedTravelTime
                            
                            self.totaldistance +=  distance / 1000
                            self.totaltime +=  time / 60
                            self.isDirected = true
                        }
//                    }
                }
                
                
                //                 distanceLabel.text = "\( totaldistance / 1000) km"
                //                 timeLabel.text = "\( totaltime / 60) minutes"
            }
        }
        
        func createDirectionsRequest(from: LocationData, to: LocationData) -> MKDirections.Request {
            let startingLocation = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: from.coordinate.coordinate.latitude, longitude: from.coordinate.coordinate.longitude))
            let destination = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: to.coordinate.coordinate.latitude, longitude: to.coordinate.coordinate.longitude))
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: startingLocation)
            request.source?.name = from.nameOfLocation
            request.destination = MKMapItem(placemark: destination)
            request.destination?.name = to.nameOfLocation
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
        
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            if overlay is StartOverlay{
                renderer.strokeColor = .red
            }
            else if overlay is AdditionalOverlay{
                renderer.strokeColor = .green
            }
            else if overlay is FinishOverlay{
                renderer.strokeColor = .blue
                
            }
            
            
            return renderer
        }
    }
}

fileprivate class StartOverlay: MKPolyline{

}
fileprivate class AdditionalOverlay: MKPolyline{

}
fileprivate class FinishOverlay: MKPolyline{

}



//protocol setNama{
//    var namaTempat: String { get }
//}
//
//extension MKPlacemark: setNama {
//    private var nama: String
//    var namaTempat: String {
//        get {
//        return nama
//        }
//
//        set {
//            nama = newValue
//        }
//
//    }
//}
//struct CONSTANT {
//    static let greenColor = UIColor.green
//    static let blueColor = UIColor.blue
//    static let redColor = UIColor.red
//}
//
//struct variables {
//    // let the default lineColor be green
//    static var lineColor = CONSTANT.greenColor
//}

//struct City{
//    var midCoordinate: CLLocationCoordinate2D
//    var overlayBoundingMapRect: MKMapRect
//}
//
//class FellowCityMapOverlay: NSObject, MKOverlay {
//    let coordinate: CLLocationCoordinate2D
//    let boundingMapRect: MKMapRect
//
//    init(city: City)
//    {
//        boundingMapRect = city.overlayBoundingMapRect
//        coordinate = city.midCoordinate
//    }
//}
//
//class FellowCityMapOverlayView: MKOverlayRenderer{
//    let overlayImage: UIImage
//
//    init(overlay: MKOverlay, overlayImage: UIImage)
//    {
//        self.overlayImage = overlayImage
//        super.init(overlay: overlay)
//    }
//
//    override func draw(
//      _ mapRect: MKMapRect,
//      zoomScale: MKZoomScale,
//      in context: CGContext
//    ) {
//      guard let imageReference = overlayImage.cgImage else { return }
//
//      let rect = self.rect(for: overlay.boundingMapRect)
//      context.scaleBy(x: 1.0, y: -1.0)
//      context.translateBy(x: 0.0, y: -rect.size.height)
//      context.draw(imageReference, in: rect)
//    }
//}
//
//enum RouteType: Int{
//    case start = 0
//    case additional = 1
//    case end = 2
//
//    func color() -> UIColor {
//        switch self
//        {
//        case .start:
//            return UIColor.red
//        case .additional:
//            return UIColor.green
//        case .end:
//            return UIColor.green
//        }
//    }
//}
//
////class LocationAnnotation: NSObject, MKPolylineRenderer {
////  // 3
////  let coordinate: CLLocationCoordinate2D
////  let title: String?
////  let subtitle: String?
////  let type: RouteType
////
////  // 4
////  init(
////    coordinate: CLLocationCoordinate2D,
////    title: String,
////    subtitle: String,
////    type: RouteType
////  ) {
////    self.coordinate = coordinate
////    self.title = title
////    self.subtitle = subtitle
////    self.type = type
////  }
////}

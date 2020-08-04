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

struct MapView: UIViewRepresentable {
    @Binding var locationmanager: CLLocationManager
    
    @State var MeetingPoint: CLLocationCoordinate2D
    @State var LocationToBeVisited: [CLLocation]
    @State var LocationToBeVisitedName: [String]

    @Binding var totaltime: Double
    @Binding var totaldistance: Double

    @State private var isDirected = false
//    let region = MKCoordinateRegion.init(center: MeetingPoint, latitudinalMeters: 10000, longitudinalMeters: 10000)
//
//    let dummylocations: [CLLocation] = LocationToBeVisited
//
//    let nameOfLocation: [String] = LocationToBeVisitedName
    
    func makeCoordinator() -> MapController {
        MapController(parent1: self)
    }
    
    func makeUIView(context: Context) -> MKMapView
    {
        let region = MKCoordinateRegion.init(center: MeetingPoint, latitudinalMeters: 10000, longitudinalMeters: 10000)

        let dummylocations: [CLLocation] = LocationToBeVisited

        let nameOfLocation: [String] = LocationToBeVisitedName
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
                self.isDirected = false
                for route in response.routes {
                    if route.advisoryNotices .isEmpty
                    {
                        if !self.isDirected
                        {
                            mapView.addOverlay(route.polyline, level: .aboveRoads)
                            mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                            distance = route.distance
                            time = route.expectedTravelTime
                            
                            self.totaldistance +=  distance / 1000
                            self.totaltime +=  time / 60
                            self.isDirected = true
                        }
                    }
                }
                
                
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

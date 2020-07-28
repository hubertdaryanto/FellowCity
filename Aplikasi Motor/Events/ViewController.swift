////
////  ViewController.swift
////  Aplikasi Motor
////
////  Created by Hubert Daryanto on 20/07/20.
////  Copyright © 2020 Hubert Daryanto. All rights reserved.
////
//
//import UIKit
//import MapKit
//import CoreLocation
//
//class ViewController: UIViewController {
//
//    @IBOutlet weak var distanceLabel: UILabel!
//    @IBOutlet weak var timeLabel: UILabel!
//    @IBOutlet weak var mapView: MKMapView!
//    
//    var distance: CLLocationDistance = 0
//    var time: CLLocationDistance = 0
//    var totaldistance: Double = 0
//    var totaltime: Double = 0
//    var previousLocation: CLLocation?
//    let locationmanager = CLLocationManager()
//    
//    let dummylocations: [CLLocation] = [CLLocation(latitude: -6.3298786, longitude: 106.9439469),
//        CLLocation(latitude: -6.258080, longitude: 106.808391),
//        CLLocation(latitude: -6.2808073, longitude: 106.7122415)
//    ]
//    let nameOfLocation: [String] = ["Pertamina Jatiasih", "Moto Village", "Lot 9 Bintaro"]
//    let dummylocation2: [CLLocation] = [CLLocation(latitude: 36.1799856, longitude: -115.1534678),
//        CLLocation(latitude: 36.1269371, longitude: -115.1590536)
//    ]
//    let region = MKCoordinateRegion.init(center: CLLocationCoordinate2D(latitude: -6.3298786, longitude: 106.9439469), latitudinalMeters: 10000, longitudinalMeters: 10000)
//     let region2 = MKCoordinateRegion.init(center: CLLocationCoordinate2D(latitude: 36.1799856, longitude: -115.1534678), latitudinalMeters: 10000, longitudinalMeters: 10000)
//    var directionsArray: [MKDirections] = []
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        mapView.delegate = self
//        mapView.setRegion(region, animated: true)
//        mapView.mapType = MKMapType.standard
//        mapView.showsTraffic = true
//        previousLocation = getCenterLocation(for: mapView)
//        getTotalEstimationTimeAndDistance(location: dummylocations, nameOfLocation: nameOfLocation)
//        
//        // Do any additional setup after loading the view.
//    }
//
//}
//
//extension ViewController: CLLocationManagerDelegate{
//    func getTotalEstimationTimeAndDistance(location: [CLLocation], nameOfLocation: [String])
//    {
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = CLLocationCoordinate2D(latitude: location[0].coordinate.latitude, longitude: location[0].coordinate.longitude)
//        annotation.title = nameOfLocation[0]
//        mapView.addAnnotation(annotation)
//        for i in 0...location.count - 2{
//            getDirections(from: location[i], to: location[i+1], nameOfLocation: nameOfLocation[i+1])
//            
//        }
//    }
//    
//    func getDirections(from: CLLocation, to: CLLocation, nameOfLocation: String)
//    {
//        
//        let request = createDirectionsRequest(from: from, to: to)
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = CLLocationCoordinate2D(latitude: to.coordinate.latitude, longitude: to.coordinate.longitude)
//        annotation.title = nameOfLocation
//        mapView.addAnnotation(annotation)
//        let directions = MKDirections(request: request)
//        
//        directions.calculate{
//            [unowned self] (response, error) in
//            //handle error if needed
//            guard let response = response else { return }//show response not available in an alert
//            
//            for route in response.routes {
//                if route.advisoryNotices .isEmpty
//                {
//                 mapView.addOverlay(route.polyline, level: .aboveRoads)
//                 mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
//                 distance = route.distance
//                 time = route.expectedTravelTime
//                
//                 totaldistance +=  distance
//                 totaltime +=  time
//                }
//            }
//             distanceLabel.text = "\( totaldistance / 1000) km"
//             timeLabel.text = "\( totaltime / 60) minutes"
//        }
//    }
//    
//    func createDirectionsRequest(from: CLLocation, to: CLLocation) -> MKDirections.Request {
//        let startingLocation = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: from.coordinate.latitude, longitude: from.coordinate.longitude))
//        let destination = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: to.coordinate.latitude, longitude: to.coordinate.longitude))
//        
//        let request = MKDirections.Request()
//        request.source = MKMapItem(placemark: startingLocation)
//        request.destination = MKMapItem(placemark: destination)
//        request.transportType = .automobile
//        request.requestsAlternateRoutes = true
//        return request
//    }
//    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
//        let latitude = mapView.centerCoordinate.latitude
//        let longitude = mapView.centerCoordinate.longitude
//        return CLLocation(latitude: latitude, longitude: longitude)
//    }
//}
//
//
//extension ViewController: MKMapViewDelegate{
//    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
//        let center = getCenterLocation(for: mapView)
//        let geoCoder = CLGeocoder()
//        
//        guard let previousLocation =  previousLocation else { return }
//        
//        guard center.distance(from: previousLocation) > 50 else { return }
//         previousLocation = center
//        
//    }
//    
//    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//        let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
//        renderer.strokeColor = .blue
//        
//        return renderer
//    }
//}

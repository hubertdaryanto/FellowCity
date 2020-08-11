//
//  EventData.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 27/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import Foundation
import SwiftUI

struct AttendEventList: Identifiable{
    var id: Int
    var name: String
    var date: String
    var time:String
}

struct EventInfo{
    var eventName: String

    var attendee: [Person]
    var isPublic: Bool
}


struct RouteInformation: Identifiable{
    var id: Int
    let place: String
}

struct EventInfoHubert{
    var eventName: String
    var startDate:Date
    var attendee: [Person]
    var isPublic: Bool
}

struct EventInfoHubertHistory: Identifiable{
    var id: Int
    var eventName: String
    var startDate:Date
    var image: Image
    var isPublic: Bool
    var isReviewed: Bool
    var rating: Double
}


var dummyHistory: [EventInfoHubertHistory] = [EventInfoHubertHistory(id: 1, eventName: "Pertamina Jatiasih -> Lot 9", startDate: formatter.date(from: "18/07/2020 8:00")!, image: Image("lot 9 bintaro"), isPublic: false, isReviewed: false, rating: 0),
                                              EventInfoHubertHistory(id: 2, eventName: "Monas -> Senopati", startDate: formatter.date(from: "19/07/2020 9:00")!, image: Image("monas"), isPublic: false, isReviewed: true, rating: 4.0),
                                              EventInfoHubertHistory(id: 3, eventName: "Senayan -> m bloc", startDate: formatter.date(from: "26/06/2020 9:00")!, image: Image("m bloc"), isPublic: false, isReviewed: true, rating: 5.0),
                                              EventInfoHubertHistory(id: 4, eventName: "Depok -> Caribou", startDate: formatter.date(from: "24/06/2020 9:00")!, image: Image("caribou"), isPublic: false, isReviewed: true, rating: 5.0),
                                              EventInfoHubertHistory(id: 5, eventName: "VesPark", startDate: formatter.date(from: "18/07/2020 8:00")!, image: Image("caribou"), isPublic: true, isReviewed: false, rating: 0.0),
EventInfoHubertHistory(id: 6, eventName: "Gentleman's Ride", startDate: formatter.date(from: "19/07/2020 9:00")!, image: Image("caribou"), isPublic: true, isReviewed: true, rating: 5.0),
EventInfoHubertHistory(id: 7, eventName: "Cool Ride", startDate: formatter.date(from: "26/06/2020 9:00")!, image: Image("caribou"), isPublic: true, isReviewed: true, rating: 5.0)]



// MARK: - Ride Level

struct RideLevel: Hashable, Identifiable{
    var id = UUID()
    var level: Int
    var numOfRide: Int
}

var rideLevels: [RideLevel] = [
RideLevel(level: 0, numOfRide: 1),
RideLevel(level: 1, numOfRide: 10),
RideLevel(level: 2, numOfRide: 20),
RideLevel(level: 3, numOfRide: 30),
RideLevel(level: 4, numOfRide: 40),
RideLevel(level: 5, numOfRide: 50),
RideLevel(level: 6, numOfRide: 100)
]


// MARK: - List Public Event

struct AllEvent: Hashable, Codable, Identifiable {
    var id = UUID()
    var creatorEvent: String
    var eventName: String
    var eventImageName: String
    var eventMeetingPoint: [String]
    var eventDestination: [String]
    var eventDate: Date
//    var eventTotalDistance: Int
//    var eventEstimation: Int
    var AdditionalRoutes: [[String]]
//    var latitude:Double
//    var longitude:Double
    var description: String
    //var reviewer:String
    var review: [String]
    var maximumPeople: Int
    var rating: Float
    var category: String
    var isPublic: Bool
    var participant: [String]
    
}

var publicEvents:[AllEvent] = [
    AllEvent(creatorEvent: "arshad-khan", eventName: "Sunmori 16/08", eventImageName: "monas",eventMeetingPoint: ["Setu Babakan","-6.341864","106.823243"],  eventDestination: ["Indonesia National Monument","-6.175456","106.827421"], eventDate: formatter.date(from: "16/08/2020 8:00")!, AdditionalRoutes: [["Moto Village Jakarta","-6.258080","106.808391"]], description: "Hello Vespa lovers, to All of you who have an interest on vespa, come and join our riding event from Setu Babakan to Monas, see you there Vespa Mania!!!", review: ["the event on GBK last month was amazing, looking forward for other event","The member of this community are very nice","Cant wait to ride together again"], maximumPeople: 15, rating: 4.3, category: "Outdoor", isPublic: true, participant: ["austin-wade","sergio-de-paula","lucas-sankey"]),
    AllEvent(creatorEvent: "austin-wade", eventName: "Gentleman’s Ride", eventImageName: "first crack coffee",eventMeetingPoint: ["Kopilot Coffee House and Kitchen","-6.2843091","106.9079593"],  eventDestination: ["First Crack Coffee","-6.1516773","106.8857449"], eventDate: formatter.date(from: "23/08/2020 9:00")!, AdditionalRoutes: [["Moto Village Jakarta","-6.258080","106.808391"]], description: "Hello gaes,, let's hangout at First Crack Coffee, they have a big discount next Sunday for Moto Lovers,, see you there", review: ["the event setup by Wade last month was amazing, looking forward for other event","The member of this community are very nice","Cant wait to ride together again"], maximumPeople: 10, rating: 4.3, category: "Outdoor", isPublic: true, participant: ["arshad-khan","sergio-de-paula","lucas-sankey"])
]

var myEvents:[AllEvent] = [
    AllEvent(creatorEvent: "fitraheri", eventName: "Sunmori 16/08", eventImageName: "monas",eventMeetingPoint: ["Setu Babakan","-6.341864","106.823243"],  eventDestination: ["Indonesia National Monument","-6.175456","106.827421"], eventDate: formatter.date(from: "16/08/2020 8:00")!, AdditionalRoutes: [["Moto Village Jakarta","-6.258080","106.808391"]], description: "Hello Vespa lovers, to All of you who have an interest on vespa, come and join our riding event from Setu Babakan to Monas, see you there Vespa Mania!!!", review: ["the event on GBK last month was amazing, looking forward for other event","The member of this community are very nice","Cant wait to ride together again"], maximumPeople: 15, rating: 4.3, category: "Outdoor", isPublic: true, participant: ["austin-wade","sergio-de-paula","lucas-sankey"]),
    AllEvent(creatorEvent: "austin-wade", eventName: "Jalan Jalan Pagi", eventImageName: "srengseng",eventMeetingPoint: ["Setu Babakan","-6.341864","106.823243"],  eventDestination: ["Srengseng City Forest","-6.208795","106.763977"], eventDate: formatter.date(from: "16/08/2020 8:00")!, AdditionalRoutes: [["Moto Village Jakarta","-6.258080","106.808391"]], description: "Hello Vespa lovers, to All of you who have an interest on vespa, come and join our riding event from Setu Babakan to Srengseng City Forest, see you there Vespa Mania!!!", review: ["the event on GBK last month was amazing, looking forward for other event","The member of this community are very nice","Cant wait to ride together again"], maximumPeople: 15, rating: 4.3, category: "Outdoor", isPublic: true, participant: ["austin-wade","sergio-de-paula","lucas-sankey"]),
    AllEvent(creatorEvent: "sergio-de-paula", eventName: "Vespa Silaturahmi", eventImageName: "OTW-Food-Street",eventMeetingPoint: ["Setu Babakan","-6.341864","106.823243"],  eventDestination: ["OTW Food Street","-6.1702427","106.9035816"], eventDate: formatter.date(from: "16/08/2020 8:00")!, AdditionalRoutes: [["Moto Village Jakarta","-6.258080","106.808391"]], description: "Hello Vespa lovers, to All of you who have an interest on vespa, come and join our riding event from Setu Babakan to OTW Food Street, see you there Vespa Mania!!!", review: ["the event on GBK last month was amazing, looking forward for other event","The member of this community are very nice","Cant wait to ride together again"], maximumPeople: 15, rating: 4.3, category: "Outdoor", isPublic: true, participant: ["austin-wade","sergio-de-paula","lucas-sankey"])
]





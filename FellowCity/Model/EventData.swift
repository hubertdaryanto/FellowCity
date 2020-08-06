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


struct RideLevel: Hashable, Identifiable{
    var id: Int
    var level: Int
    var numOfRide: Int
}

var rideLevels: [RideLevel] = [
RideLevel(id: 1, level: 1, numOfRide: 10),
RideLevel(id: 2, level: 2, numOfRide: 20),
RideLevel(id: 3, level: 3, numOfRide: 30),
RideLevel(id: 4, level: 4, numOfRide: 40),
RideLevel(id: 5, level: 5, numOfRide: 50),
RideLevel(id: 6, level: 6, numOfRide: 100)
]

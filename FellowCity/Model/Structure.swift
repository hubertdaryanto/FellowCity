//
//  Structure.swift
//  Aplikasi Motor
//
//  Created by Kevin Timotius on 29/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import Foundation
import SwiftUI

struct AllRide{
    var locID: Int
    var locName: String
    var locDetailed: String
    var ratingScore: Float
    var maxPeople: Int
    var totalRating: Int
    var reviewText: String
}

//struct AllEvent {
//    var listEvent: String
//    var dateEvent: Date
//    var timeEvent: Int
//    var nameEvent: String
//    var totalDistance: Int
//    var estTime: Int
//    var routeEvent: String
//    var meetingPoint: String
//}

struct CreateEvent {
    var nameEvent: String
    var meetingPoint: String
    var destination: String
    var dateTimeEvent: Date
    var friendList : String
    var joinedFriend: String
}

struct Identities {
    var name: String
    var status: String
    var image: String
    var userId: Int
    var mutualFriends: Int
    var rideHistory: String
    var motorcycleBrand: String
    var motorcycleType : String
}

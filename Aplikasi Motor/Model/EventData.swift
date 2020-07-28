//
//  EventData.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 27/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import Foundation


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



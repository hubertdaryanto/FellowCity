//
//  Events+CoreDataProperties.swift
//  FellowCity
//
//  Created by Kevin Timotius on 06/08/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//
//

import Foundation
import CoreData


extension Events {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Events> {
        return NSFetchRequest<Events>(entityName: "Events")
    }

    @NSManaged public var eventName: String?
    @NSManaged public var eventMeetingPoint: String?
    @NSManaged public var eventDate: Date?
    @NSManaged public var eventDestination: String?
    @NSManaged public var selectedRoute: String?
    @NSManaged public var saved: Bool

}

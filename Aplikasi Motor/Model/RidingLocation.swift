//
//  RidingLocation.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 21/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import Foundation
import SwiftUI

struct ExploreLocation: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var province: String
    var rating: Float
    var reviewCount: Int
    var maxPeople: Int
}

struct EventLocation: Identifiable {
    var id = UUID()
    var name: String
    var province: String
    var rating: Float
    var reviewCount: Int
    var maxPeople: Int
}

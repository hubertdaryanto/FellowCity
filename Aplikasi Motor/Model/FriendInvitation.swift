//
//  FriendInvitations.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 22/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import Foundation
import SwiftUI

struct Music: Identifiable, Hashable {
    var id = UUID()
    var name: String
}

struct FriendInvitation: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var mutualFriend: Int
}

struct Event: Identifiable {
    var id = UUID()
    var name: String
    var origin: String
    var destination: String
}

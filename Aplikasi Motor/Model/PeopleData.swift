//
//  PeopleData.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 27/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import Foundation
import SwiftUI

struct FriendList: Identifiable
{
    var id: Int
    var name: String
}

struct Person: Identifiable{
    var id: Int
    var name: String
    var image: Image
}

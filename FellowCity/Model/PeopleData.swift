//
//  PeopleData.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 27/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import Foundation
import SwiftUI

struct FriendList: Identifiable, Hashable
{
    var id: Int
    var name: String
}

struct Person: Identifiable{
    var id: Int
    var name: String
    var image: Image
}


struct Profile: Identifiable {
    var id: Int
    var name: String
    var imageName: Image
    var motorcycle: String
    var userId: String
    var password: String
    
}

struct User: Hashable, Identifiable{
    var id = UUID()
    var name: String
    var imageName: String
    var userID: String
    var contact: String
    var isAvailableToRide: Bool
    var numOfRide: Int
}



//var allUsers: [User] = [
//User(id: 1, name: "Rossi", userID: "VR46"),
//User(id: 2, name: "Marquez", userID: "M93"),
//User(id: 3, name: "Doni Tata", userID: "DT90"),
//User(id: 4, name: "Lorenzo", userID: "L99"),
//User(id: 5, name: "Vinales", userID: "V20"),
//User(id: 6, name: "Biaggi", userID: "B30")
//]

var allUsers: [User] = [
    User(name: "Anastasia Vityukova", imageName: "", userID: "anastasia38", contact: "+6281567838829", isAvailableToRide: false, numOfRide: 20),
    User(name: "Arshad Khan", imageName: "arshad-khan", userID: "arshad87", contact: "+6281567838778", isAvailableToRide: true, numOfRide: 20),
    User(name: "Austin Wade", imageName: "austin-wade", userID: "Austin_10", contact: "+628156783255859", isAvailableToRide: true, numOfRide: 20),
    User(name: "Craig Mckay", imageName: "craig-mckay", userID: "craigMC", contact: "+6281563538243", isAvailableToRide: false, numOfRide: 20),
    User(name: "Ethan Hoover", imageName: "ethan-hoover", userID: "EthanWay", contact: "+62812355329", isAvailableToRide: true, numOfRide: 20),
    User(name: "Goh Ryan", imageName: "goh-ryan", userID: "goh7567", contact: "+6281809038843", isAvailableToRide: false, numOfRide: 5),
    User(name: "Harishan Kobalasingam", imageName: "harishan-kobalasingam", userID: "harishan90", contact: "+628113436459", isAvailableToRide: false, numOfRide: 20),
    User(name: "Jonathan Cooper", imageName: "jonathan-cooper", userID: "JCooper", contact: "+6281903017483", isAvailableToRide: true, numOfRide: 10),
    User(name: "Kal Visuals", imageName: "kal-visuals", userID: "kalVee", contact: "+6281238190304", isAvailableToRide: false, numOfRide: 20),
    User(name: "Lucas Sankey", imageName: "lucas-sankey", userID: "Luckey", contact: "+628183819247894", isAvailableToRide: true, numOfRide: 20),
    User(name: "Sergio De Paula", imageName: "sergio-de-paula", userID: "SergiDP", contact: "+6281738192564", isAvailableToRide: true, numOfRide: 20)
]

//Name    String
//UserID    String
//Contact    String
//Status    Bool
//Level    Int
//numOfRide    Int

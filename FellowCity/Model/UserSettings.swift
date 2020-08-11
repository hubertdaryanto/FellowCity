//
//  UserSettings.swift
//  FellowCity
//
//  Created by Feri Fajri on 11/08/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    @Published var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "name")
        }
    }
    
    @Published var imageName: String {
        didSet {
            UserDefaults.standard.set(imageName, forKey: "imageName")
        }
    }
    
    @Published var userID: String {
        didSet {
            UserDefaults.standard.set(userID, forKey: "userID")
        }
    }
    
    @Published var contact: String {
        didSet {
            UserDefaults.standard.set(contact, forKey: "contact")
        }
    }
    
    @Published var isAvailableToRide: Bool {
        didSet {
            UserDefaults.standard.set(isAvailableToRide, forKey: "isAvailableToRide")
        }
    }
    
    @Published var numOfRide: Int {
        didSet {
            UserDefaults.standard.set(numOfRide, forKey: "numOfRide")
        }
    }
    
    //public var ringtones = ["Chimes", "Signal", "Waves"]
    
    init() {
        self.name = UserDefaults.standard.object(forKey: "name") as? String ?? "John Richard"
        self.imageName = UserDefaults.standard.object(forKey: "imageName") as? String ?? "oleg-yeltsov"
        self.userID = UserDefaults.standard.object(forKey: "userID") as? String ?? "JRD46"
        self.contact = UserDefaults.standard.object(forKey: "contact") as? String ?? "+6281235328879"
        self.isAvailableToRide = UserDefaults.standard.object(forKey: "isAvailableToRide") as? Bool ?? false
        self.numOfRide = UserDefaults.standard.object(forKey: "numOfRide") as? Int ?? 20
    }
}


// MARK: - User Settings
///
//    @State var myUserSettings: User = User(name: name, imageName: "fitraeri", userID: "fitrakuy", contact: "+6281235328879", isAvailableToRide: false, numOfRide: 20)
//
//struct myUserSetting: Hashable, Identifiable{
//    var id = UUID()
//    var name: String
//    var imageName: String
//    var userID: String
//    var contact: String
//    var isAvailableToRide: Bool
//    var numOfRide: Int
//}

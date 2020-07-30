//
//  Explore.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 27/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

//{
//"id" : 1001,
//"name" : "Kota Tua",
//"imageName" : "kotatua",
//"latitude" : -6.139954,
//"longitude" : 106.8253265,
//"description" : "Jakarta’s old town, Kota Tua centers on Fatahillah Square, a lively plaza with regular traditional dance shows. The Jakarta History Museum is a Dutch-era building with paintings and antiques, while the Wayang Museum displays Javanese wooden puppets. Glodok village, or Chinatown, is popular for street food like dumplings and fried noodles. Nearby, schooners and fishing vessels ply old-world Sunda Kelapa port.",
//"review" : [
//{ "reviewer" : "Edward Alexander", "review" : "Great place to hang out and play. Has many sport courts (futsal, basketball, volleyball). They also have many photoshoot spots. Overall, a great place to spent your leisure time. Please maintain physical distancing as we are still in the COVID-19 pandemic situation." },
//{ "reviewer" : "Ea Tipene", "review" : "Taman menteng is really suitable for everyone who want to release stress. Here also have volley and basketball field also jogging track. located near kuningan (bussiness area)" },
//{ "reviewer" : "Devedas Nandi", "review" : "Twice visited here, i really enjoy being here. Having a nice time with my family" }
//],
//"MaximumPeople" : 100,
//"category" : "Outdoor"
//}

import Foundation
import SwiftUI

struct Explore: Hashable, Codable, Identifiable {
    var id: Int
    var name:String
    var province:String
    var imageName:String
    var latitude:Double
    var longitude:Double
    var description:String
    //var reviewer:String
    var review:String
    var maximumPeople:Int
    var rating:Float
    var reviewCount:Int
    var category:Category
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case indoor = "Indoor"
        case outdoor = "Outdoor"
    }
    
}


struct ExploreRevised: Hashable, Codable, Identifiable {
    var id: Int
    var name:String
    var province:String
    var imageName:String
    var latitude:Double
    var longitude:Double
    var description:String
    //var reviewer:String
    var review: [String]
    var maximumPeople:Int
    var rating:Float
    var category:Category
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case indoor = "Indoor"
        case outdoor = "Outdoor"
    }
    
}


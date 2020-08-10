//
//  ViewRouter.swift
//  FellowCity
//
//  Created by Feri Fajri on 10/08/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import Foundation


class ViewRouter: ObservableObject {

    init() {
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            currentPage = "onboardingView"
        } else {
            currentPage = "appView"
        }
    }
    
    @Published var currentPage: String
    
}

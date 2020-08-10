//
//  SplashScreenView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 30/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI


struct SplashScreenView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    // 1.
    @State var isActive:Bool = false
    
    var body: some View {
        VStack {
            // 2.
            if self.isActive {
                // 3.
                // Straight to homeView
                // AppView()
                
                // Check onboarding or not
                
                    if viewRouter.currentPage == "onboardingView" {
                        OnboardingView()
                    } else if viewRouter.currentPage == "appView" {
                        AppView()
                    }
                
                
            } else {
                // 4.
                ZStack{
                    //Color(hex: 0xF7B500, alpha: 1).edgesIgnoringSafeArea(.all)
                    LinearGradient(gradient: Gradient(
                        colors: [Color(hex: 0xF7B500, alpha: 0.6), Color(hex: 0xF7B500, alpha: 1)]
                        )
                        
                        //                    , startPoint: .leading, endPoint: .trailing)
                        , startPoint: .top, endPoint: .bottom)
                        
                        
                        .edgesIgnoringSafeArea(.all)
                    
                    Image("FellowCity")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 60, alignment: .center)
                }
            }
        }
            // 5.
            .onAppear {
                // 6.
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    // 7.
                    withAnimation {
                        self.isActive = true
                    }
                }
        }
    }
    
}


struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView().environmentObject(ViewRouter())
    }
}

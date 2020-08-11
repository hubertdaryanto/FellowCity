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
    @State var isScaled: Bool = false
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
                        colors: [Color("baseColor").opacity(0.6), Color("baseColor").opacity(1)]
                        )
                        
                        //                    , startPoint: .leading, endPoint: .trailing)
                        , startPoint: .top, endPoint: .bottom)
                        
                        
                        .edgesIgnoringSafeArea(.all)
                    
                    Image("FellowCity")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 120, height: 60, alignment: .center)
                        .scaleEffect(isScaled ? 0.1 : 0, anchor: .center)
                        .animation(Animation.easeOut(duration: 0.6))
                        .scaleEffect(isScaled ? 1 : 1.2, anchor: .center)
                        .animation(Animation.easeOut(duration: 0.2).delay(0.6))
                        
                        .onAppear() {
                            self.isScaled.toggle()
                        }
                }
            }
        }
            // 5.
            .onAppear {
                // 6.
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
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

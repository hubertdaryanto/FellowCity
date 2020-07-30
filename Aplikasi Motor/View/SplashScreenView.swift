//
//  SplashScreenView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 30/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI


struct SplashScreenView: View {
    
    // 1.
    @State var isActive:Bool = false
    
    var body: some View {
        VStack {
            // 2.
            if self.isActive {
                // 3.
                AppView()
            } else {
                // 4.
                ZStack{
                Color(hex: 0xF7B500, alpha: 1).edgesIgnoringSafeArea(.all)
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
        SplashScreenView()
    }
}

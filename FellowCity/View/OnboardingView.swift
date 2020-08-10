//
//  OnboardingView.swift
//  FellowCity
//
//  Created by Feri Fajri on 07/08/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var currentPageIndex = 0
//    @State private var page = 1
//    @State private var offset = CGSize.zero
    
    @State var imagename:String = "flag.circle.fill"
    @State var title:String = "Create Events"
    @State var subtitle:String = "Create your personal events where you can invite your friends and pick custom routes"
    
    var subviews = [
        UIHostingController(rootView: OnboardingCardView(imagename: "flag.circle.fill", title: "Create Events", subtitle: "Create your personal events where you can invite your friends and pick custom routes")),
        UIHostingController(rootView: OnboardingCardView(imagename: "arrow.right.arrow.left.circle", title: "Ride", subtitle: "Explore and join events that recommended by us or created by other riders!")),
        UIHostingController(rootView: OnboardingCardView(imagename: "person.3.fill", title: "Join Community", subtitle: "Increase your connection and networking by adding friends and joining public events")),
        UIHostingController(rootView: OnboardingCardView(imagename: "clock.fill", title: "Level Up", subtitle: "Increase your achievement based on your riding activity"))
    ]
    
    var body: some View {
        
        VStack {
        PageViewController(viewControllers: subviews, currentPageIndex: $currentPageIndex)
            .frame(height: 600)
            
            ZStack{
            PageControl(numberOfPages: subviews.count, currentPageIndex: $currentPageIndex)
            HStack {
                Spacer()
                
//                Spacer()
                Button(action: {
                    if self.currentPageIndex+1 == self.subviews.count {
                        self.currentPageIndex = 0
                    } else {
                        self.currentPageIndex += 1
                    }
                }) {
                    
                    if self.currentPageIndex == 3 {
//                        Text("\(self.currentPageIndex)")
//                        Spacer()
                    ButtonContent(texta: "Finish")
                    } else {
//                        Text("\(self.currentPageIndex)")
                        Spacer()
                        ButtonContent(texta: "Next")
                    }
                
                }
            }
                .padding()
            }
    }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

struct ButtonContent: View {
    
    @State var texta:String
    
var body: some View {
    Text("\(self.texta)")
            .foregroundColor(.orange)
            .frame(width: 50, height: 50)
            .padding()
    }
//Image(systemName: "arrow.right")
//        .resizable()
//        .foregroundColor(.white)
//        .frame(width: 30, height: 30)
//        .padding()
//        .background(Color.orange)
//        .cornerRadius(30)

}





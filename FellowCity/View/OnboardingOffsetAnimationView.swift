//
//  OnboardingView.swift
//  FellowCity
//
//  Created by Feri Fajri on 07/08/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct OnboardingOffsetAnimationView: View {
    
    @State private var page = 1
    @State private var offset = CGSize.zero
    
    var body: some View {
        
        ZStack {
            
            
            GeometryReader { reader in
                VStack{
                    
                HStack {
                    // Page 1
                    VStack(spacing: 40) {
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(Color(hex: 0xF7B500, alpha: 1))
//                            .padding()
//                            .frame(width: reader.frame(in: .global).width * 0.95, height: reader.frame(in: .global).height * 0.8 )
                            
                            
                        
                    VStack(spacing: 0) {
                        Spacer()
                        Image(systemName: "flag.circle.fill").resizable()
                            .foregroundColor(Color(.white))
                            .frame(width: 70, height: 70, alignment: .center)
                        //                        .shadow(radius: 1, x: 1, y: 1)
                        Spacer()
                        VStack{
                        Text("Create Events")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Create your personal events where you can invite your friends and pick custom routes")
                            .font(.body)
//                            .fontWeight(.bold)
                            .frame(width: reader.frame(in: .global).width * 0.7)
                        }
                        .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        Spacer()
                        }
//                    .frame(width: reader.frame(in: .global).width * 0.95)
                        }
//                    .frame(width: reader.frame(in: .global).width * 1 )
                    }.frame(width: reader.frame(in: .global).width * 0.98 )
                    

                    
//                    // Page 2
                                       VStack(spacing: 40) {
                                        ZStack {
                                            
                                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                                .fill(Color(hex: 0xF7B500, alpha: 1))
                    //                            .padding()
                    //                            .frame(width: reader.frame(in: .global).width * 0.95, height: reader.frame(in: .global).height * 0.8 )
                                                
                                                
                                            
                                        VStack(spacing: 0) {
                                            Spacer()
                                            Image(systemName: "arrow.right.arrow.left.circle").resizable()
                                                .foregroundColor(Color(.white))
                                                .frame(width: 70, height: 70, alignment: .center)
                                            //                        .shadow(radius: 1, x: 1, y: 1)
                                            Spacer()
                                            VStack{
                                            Text("Ride")
                                                .font(.title)
                                                .fontWeight(.bold)
                                            Text("Explore and join events that recommended by us or created by other riders!")
                                                .font(.body)
                    //                            .fontWeight(.bold)
                                                .frame(width: reader.frame(in: .global).width * 0.7)
                                            }
                                            .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                                            Spacer()
                                            }
                    //                    .frame(width: reader.frame(in: .global).width * 0.95)
                                            }
//                                        .frame(width: reader.frame(in: .global).width * 1 )
                                        }.frame(width: reader.frame(in: .global).width * 0.98 )
                        // Page 3
                                       VStack(spacing: 40) {
                                        ZStack {
                                            
                                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                                .fill(Color(hex: 0xF7B500, alpha: 1))
                    //                            .padding()
                    //                            .frame(width: reader.frame(in: .global).width * 0.95, height: reader.frame(in: .global).height * 0.8 )
                                                
                                                
                                            
                                        VStack(spacing: 0) {
                                            Spacer()
                                            Image(systemName: "person.3.fill").resizable()
                                                .foregroundColor(Color(.white))
                                                .frame(width: 120, height: 80)
                                            //                        .shadow(radius: 1, x: 1, y: 1)
                                            Spacer()
                                            VStack{
                                            Text("Join Community")
                                                .font(.title)
                                                .fontWeight(.bold)
                                            Text("Increase your connection and networking by adding friends and joining public events")
                                                .font(.body)
                    //                            .fontWeight(.bold)
                                                .frame(width: reader.frame(in: .global).width * 0.7)
                                            }
                                            .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                                            Spacer()
                                            }
                    //                    .frame(width: reader.frame(in: .global).width * 0.95)
                                            }
//                                        .frame(width: reader.frame(in: .global).width * 1 )
                                        }.frame(width: reader.frame(in: .global).width * 0.98 )
                    
//                    // Page 4
                                                           VStack(spacing: 40) {
                                                            ZStack {

                                                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                                                    .fill(Color(hex: 0xF7B500, alpha: 1))
                                        //                            .padding()
                                        //                            .frame(width: reader.frame(in: .global).width * 0.95, height: reader.frame(in: .global).height * 0.8 )



                                                            VStack(spacing: 0) {
                                                                Spacer()
                                                                Image(systemName: "clock.fill").resizable()
                                                                    .foregroundColor(Color(.white))
                                                                    .frame(width: 80, height: 80)
                                                                //                        .shadow(radius: 1, x: 1, y: 1)
                                                                Spacer()
                                                                VStack{
                                                                Text("Level Up")
                                                                    .font(.title)
                                                                    .fontWeight(.bold)
                                                                Text("Increase your achievement based on your riding activity")
                                                                    .font(.body)
                                        //                            .fontWeight(.bold)
                                                                    .frame(width: reader.frame(in: .global).width * 0.7)
                                                                }
                                                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                                                                Spacer()
                                                                }
                                        //                    .frame(width: reader.frame(in: .global).width * 0.95)
                                                                }
                    //                                        .frame(width: reader.frame(in: .global).width * 1 )
                                                            }.frame(width: reader.frame(in: .global).width * 0.98 )


                }
                .multilineTextAlignment(.center)
                    .padding(.vertical, 60)
//                    .frame(width: reader.frame(in: .global).width * 3)
                    .frame(width: reader.frame(in: .global).width * 4)
                    .frame(maxHeight: .infinity)
                    
                     
                    
//                    .offset(x: self.page == 1 ? reader.frame(in: .global).width : self.page == 2 ? 0 : -reader.frame(in: .global).width )
                    .offset(x: self.page == 1 ? reader.frame(in: .global).width * 1.5 : self.page == 2 ? reader.frame(in: .global).width * 0.5 : self.page == 3 ? reader.frame(in: .global).width * -0.5 : reader.frame(in: .global).width * -1.5)
                    .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8))
                    
                
             
//                Spacer()
                            // Tombol next page
                            
                            HStack {
                                
                                Button(action: {self.page = 1}) {
                                    Image(systemName: "1.circle")
                                    .padding()
                                        .scaleEffect(self.page == 1 ? 1 : 0.65)
                                    .accentColor(self.page == 1 ? Color.black : Color.white)
                                }
                                Button(action: {self.page = 2}) {
                                    Image(systemName: "2.circle")
                                    .padding()
                                        .scaleEffect(self.page == 2 ? 1 : 0.65)
                                    .accentColor(self.page == 2 ? Color.black : Color.white)
                                }
                                Button(action: {self.page = 3}) {
                                    Image(systemName: "3.circle")
                                    .padding()
                                        .scaleEffect(self.page == 3 ? 1 : 0.65)
                                    .accentColor(self.page == 3 ? Color.black : Color.white)
                                }
                                Button(action: {self.page = 4}) {
                                    Image(systemName: "4.circle")
                                    .padding()
                                        .scaleEffect(self.page == 4 ? 1 : 0.65)
                                    .accentColor(self.page == 4 ? Color.black : Color.white)
                                }
                                
                            }
                            .offset(y: -reader.frame(in: .global).height * 0.2)
                            .animation(.spring(response: 0.4, dampingFraction: 0.5))
                            .font(.largeTitle)
                                
                //            .accentColor(Color(hex: 0xF7B500, alpha: 1))
                
            }
            
            
            
            }
            
        }
    }
}

struct OnboardingOffsetAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingOffsetAnimationView()
    }
}

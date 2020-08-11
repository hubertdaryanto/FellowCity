//
//  OnboardingCardView.swift
//  FellowCity
//
//  Created by Feri Fajri on 10/08/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct OnboardingCardView: View {
    
    @State private var page = 1
    @State private var offset = CGSize.zero
    
    @State var imagename:String
//        = "flag.circle.fill"
    @State var title:String
//        = "Create Events"
    @State var subtitle:String
//        = "Create your personal events where you can invite your friends and pick custom routes"
    
    var body: some View {

                    
                    
                    GeometryReader { reader in
                        VStack{
                            
                        HStack {
                            // Page 1
                            VStack(spacing: 40) {
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .fill(Color("baseColor").opacity(1))
                                
                            VStack(spacing: 0) {
                                Spacer()
                                Image(systemName: self.imagename)
//                                    .resizable()
//                                    .foregroundColor(Color(.white))
//                                    .frame(width: 70, height: 70, alignment: .center)
                                
                                .resizable()
                                    
//                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fill)
                                    
                                .frame(width: 70, height: 70)
                                    .foregroundColor(Color(.white))
//                                .clipShape(Circle())
                                //                                .background(Color.white)
//                                .overlay(RoundedRectangle(cornerRadius: 36)
//                                    .stroke(Color("baseColor"), lineWidth: 1))
//                                .shadow(radius: 1, x: 1, y: 1)
                                    
                                //                        .shadow(radius: 1, x: 1, y: 1)
                                Spacer()
                                VStack{
                                    Text("\(self.title)")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("\(self.subtitle)")
                                    .font(.body)
                                    .frame(width: reader.frame(in: .global).width * 0.7)
                                }
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                                Spacer()
                                }
                                }
                            }.frame(width: reader.frame(in: .global).width * 0.95 )
                            



                        }
                        .multilineTextAlignment(.center)
                            .padding(.vertical, 60)
        //                    .frame(width: reader.frame(in: .global).width * 3)
                            .frame(width: reader.frame(in: .global).width)
                            .frame(maxHeight: .infinity)
                            
                             
                            
        //                    .offset(x: self.page == 1 ? reader.frame(in: .global).width : self.page == 2 ? 0 : -reader.frame(in: .global).width )
//                            .offset(x: self.page == 1 ? reader.frame(in: .global).width * 1.5 : self.page == 2 ? reader.frame(in: .global).width * 0.5 : self.page == 3 ? reader.frame(in: .global).width * -0.5 : reader.frame(in: .global).width * -1.5)
//                            .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8))
                            
//
//
//        //                Spacer()
//                                    // Tombol next page
//
//                                    HStack {
//
//                                        Button(action: {self.page = 1}) {
//                                            Image(systemName: "1.circle")
//                                            .padding()
//                                                .scaleEffect(self.page == 1 ? 1 : 0.65)
//                                            .accentColor(self.page == 1 ? Color.black : Color.white)
//                                        }
//                                        Button(action: {self.page = 2}) {
//                                            Image(systemName: "2.circle")
//                                            .padding()
//                                                .scaleEffect(self.page == 2 ? 1 : 0.65)
//                                            .accentColor(self.page == 2 ? Color.black : Color.white)
//                                        }
//                                        Button(action: {self.page = 3}) {
//                                            Image(systemName: "3.circle")
//                                            .padding()
//                                                .scaleEffect(self.page == 3 ? 1 : 0.65)
//                                            .accentColor(self.page == 3 ? Color.black : Color.white)
//                                        }
//                                        Button(action: {self.page = 4}) {
//                                            Image(systemName: "4.circle")
//                                            .padding()
//                                                .scaleEffect(self.page == 4 ? 1 : 0.65)
//                                            .accentColor(self.page == 4 ? Color.black : Color.white)
//                                        }
//
//                                    }
//                                    .offset(y: -reader.frame(in: .global).height * 0.2)
//                                    .animation(.spring(response: 0.4, dampingFraction: 0.5))
//                                    .font(.largeTitle)
                                        
 
                    
                    
                    
                    }
                    
                }
    }
}

struct OnboardingCardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCardView(imagename: "", title: "", subtitle: "")
    }
}

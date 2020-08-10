//
//  HistoryNonPublicEventReview.swift
//  Aplikasi Motor
//
//  Created by Hubert Daryanto on 29/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle{
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .frame(width: 315, height: 150, alignment: .top).padding(20).foregroundColor(Color.init(hex: "#6D7278"))
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 1))
    }
}

struct HistoryReview: View {
    var history: EventInfoHubertHistory
    @State var rating: Int = 0
    @State var reviewText: String = "Tell us about your riding experience"
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                
                
                VStack{
                    Text(self.history.eventName).font(.custom("SFProDisplay-Bold", size: 20)).foregroundColor(Color("baseColor").opacity(1)).padding(.top, 22).lineSpacing(24)
                    
                    Text(DateFormatterForHistory.string(from: self.history.startDate)).font(.custom("SFProDisplay-Light", size: 14)).padding(.top, 9)
                }.frame(height: geometry.size.height * 0.1, alignment: .top)
                
                //            Spacer()
                
                VStack{
                    self.history.image.resizable().frame(width: 227, height: 176, alignment: .center).cornerRadius(10).opacity(0.8).lineSpacing(16).padding(.top, 15)
                    Text("Rate your experience")
                        .font(.custom("SFProDisplay-Semibold", size: 18)).lineSpacing(21).padding(.top, 11)
                    
                    RatingView(rating: self.$rating).padding(.top, 9)
                    Spacer().frame(width: 375, height: 70)
                }.frame(height: geometry.size.height * 0.35, alignment: .top)
                
                Spacer()
                VStack{
                    TextField("Enter your review", text: self.$reviewText).textFieldStyle(CustomTextFieldStyle()).font(.custom("SFProDisplay-Light", size: 14))
                }.frame(height: geometry.size.height * 0.1)
                //            Spacer()
                Button(action: {
                    //ini buat nambahin list review ke dalam data list event / tempat tujuan
                    exploreData[5].review.append(self.reviewText)
                    exploreData[5].rating = ((exploreData[5].rating * Float((exploreData[5].review.count - 1))) + Float(self.rating)) / Float(exploreData[5].review.count)
                    dummyHistory[0].isReviewed = true
                    dummyHistory[0].rating = Double(self.rating)
                    self.mode.wrappedValue.dismiss()
                })
                {
                    Text("Submit").font(.custom("SFProDisplay-Bold", size: 20)).fontWeight(.bold)
                        .frame(width: 127, height: 47, alignment: .center)
                        .background(Color("baseColor").opacity(1)).cornerRadius(10).lineSpacing(16).foregroundColor(Color.black)
                }.padding()
                    .frame(height: geometry.size.height * 0.2, alignment: .bottom)
                //            Spacer()
            }
        }.navigationBarTitle("Review")
    }
}

struct HistoryNonPublicEventReview_Previews: PreviewProvider {
    static var previews: some View {
        HistoryReview(history: dummyHistory[0])
    }
}

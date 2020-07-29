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
            .frame(width: 315, height: 182, alignment: .top).padding(20).foregroundColor(Color.init(hex: "#6D7278"))
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 1))
    }
}

struct HistoryReview: View {
    var history: EventInfoHubertHistory
    @State var rating: Int = 0
    @State var reviewText: String = "Tell us about your riding experience"
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack{
            Text(history.eventName).font(.custom("SFProDisplay-Bold", size: 20)).foregroundColor(Color(hex: "#F7B500")).padding(.top, 22).lineSpacing(24)
            Text(DateFormatterForHistory.string(from: history.startDate)).font(.custom("SFProDisplay-Light", size: 14)).padding(.top, 9)
            history.image.resizable().frame(width: 227, height: 176, alignment: .center).cornerRadius(10).opacity(0.8).lineSpacing(16).padding(.top, 15)
            Text("Rate your experience")
                .font(.custom("SFProDisplay-Semibold", size: 18)).lineSpacing(21).padding(.top, 11)
            RatingView(rating: $rating).padding(.top, 9)
            Spacer().frame(width: 375, height: 70)
            TextField("Enter your review", text: $reviewText).textFieldStyle(CustomTextFieldStyle()).font(.custom("SFProDisplay-Light", size: 14))
            Button(action: {
                //ini buat nambahin list review ke dalam data list event / tempat tujuan
                
                self.mode.wrappedValue.dismiss()
            })
            {
                Text("Submit").font(.custom("SFProDisplay-Bold", size: 20)).fontWeight(.bold)
                    .frame(width: 127, height: 47, alignment: .center)
                    .background(Color.yellow).cornerRadius(10).lineSpacing(16).foregroundColor(Color.black)
            }.padding(.top, 32)
            
        }.navigationBarTitle("Review")
    }
}

struct HistoryNonPublicEventReview_Previews: PreviewProvider {
    static var previews: some View {
        HistoryReview(history: dummyHistory[0])
    }
}

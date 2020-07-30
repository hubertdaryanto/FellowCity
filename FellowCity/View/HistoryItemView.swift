//
//  HistoryItemView.swift
//  Aplikasi Motor
//
//  Created by Hubert Daryanto on 29/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

extension Date {
    
    func dateFormatWithSuffix() -> String {
        return "dd'\(self.daySuffix())' MMMM yyyy / h a"
    }
    
    func daySuffix() -> String {
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.day, from: self)
        let dayOfMonth = components.day
        switch dayOfMonth {
        case 1, 21, 31:
            return "st"
        case 2, 22:
            return "nd"
        case 3, 23:
            return "rd"
        default:
            return "th"
        }
    }
}

var DateFormatterForHistory: DateFormatter = {
    let formatter = DateFormatter()
    let date = Date()
    formatter.timeZone = .current
    formatter.locale = .current
    formatter.dateFormat = date.dateFormatWithSuffix()
    formatter.amSymbol = "AM"
    formatter.pmSymbol = "PM"
    return formatter
}()

struct HistoryItemView: View {
    var history: EventInfoHubertHistory
    @State var isPublic: Bool
    @State var isReviewed: Bool
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack(alignment: .top){
                self.history.image
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 103, height: 79)
                    .cornerRadius(10)
                    .shadow(radius: 5).padding(.leading, 14).padding(.top, 20)
                VStack (alignment: .leading){
                    Text(self.history.eventName).font(.custom("SFProDisplay-Semiold", size: 15)).lineSpacing(17.9).foregroundColor(.yellow).padding(.top, 20).frame(maxWidth: 375, alignment: .leading).padding(.leading, 4)
                    Text(DateFormatterForHistory.string(from: self.history.startDate)).font(.custom("SFProDisplay-Light", size: 14)).foregroundColor(Color.gray).lineSpacing(16).padding(.leading, 4).padding(.top, 3)
                    if self.history.isReviewed{
                        HStack(spacing:0){
                            ForEach(0..<Int(modf(self.history.rating).0)) { numstar in
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(Color.yellow)
                            }
                            
                            if (round(modf(self.history.rating).1 * 2) / 2 ) == 1 {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(Color.yellow)
                            } else if ((modf(self.history.rating).1 * 2) / 2)  > 0 && ((modf(self.history.rating).1 * 2) / 2)  < 1  {
                                Image(systemName: "star.lefthalf.fill")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(Color.yellow)
                            }
                        }.padding(.leading, 3)
                        
                    }
                }
                
            }
            HStack{
                Button(action: {
                    //self.deleteEventInvitationsList(at:self.EventInvitationsList.firstIndex(where: { $0.id == index.id })!)
                }){
                    if self.history.isReviewed{
                        Text("Reviewed").font(.custom("SFProDisplay-Bold", size: 14)).fontWeight(.bold)
                            .frame(width: 101, height: 34, alignment: .center)
                            .background(Color.white).cornerRadius(10).lineSpacing(16)
                    }
                    else
                    {
                        NavigationLink(destination: HistoryReview(history: self.history))
                        {
                            Text("Give Review").font(.custom("SFProDisplay-Bold", size: 14)).fontWeight(.bold)
                                .frame(width: 101, height: 34, alignment: .center)
                                .background(Color.yellow).cornerRadius(10).lineSpacing(16).foregroundColor(Color.black)
                        }
                    }
                    
                }
                .buttonStyle(PlainButtonStyle())
                .shadow(radius: 2, x: 1, y: 2).padding(.leading, 16).padding(.top, 23)
                
                if isPublic == false
                {
                    Button(action: {
                        print("Ubah State Ride Disini")
                        //self.deleteEventInvitationsList(at:self.EventInvitationsList.firstIndex(where: { $0.id == index.id })!)
                        //                    CreateEventView(eventName: self.history.eventName)
                        
                        
                    }){
                        NavigationLink(destination: CreateEventView(eventName: self.history.eventName))
                        {
                            Text("Ride Again")
                                .font(.custom("SFProDisplay-Bold", size: 14)).fontWeight(.bold)
                                .frame(width: 101, height: 34, alignment: .center)
                                .background(Color.yellow).cornerRadius(10).lineSpacing(16)
                            
                        }
                        .accentColor(.black)
                        //                    Text("Ride Again").font(.custom("SFProDisplay-Bold", size: 14)).fontWeight(.bold)
                        //                        .frame(width: 101, height: 34, alignment: .center)
                        //                    .background(Color.yellow).cornerRadius(10).lineSpacing(16)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .shadow(radius: 2, x: 1, y: 2).padding(.top, 23).padding(.leading, 12)
                }
                
            }
            
        }
    }
}

struct HistoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryItemView(history: dummyHistory[0], isPublic: false, isReviewed: false)
    }
}

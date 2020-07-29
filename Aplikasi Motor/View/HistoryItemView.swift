//
//  HistoryItemView.swift
//  Aplikasi Motor
//
//  Created by Hubert Daryanto on 29/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct HistoryItemView: View {
    var history: EventInfoHubertHistory
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack(alignment: .top){
                self.history.image
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 103, height: 79)
                    .cornerRadius(10)
                    .shadow(radius: 5).padding(20)
                VStack (alignment: .leading){
                    Text(self.history.eventName).font(.headline).foregroundColor(.yellow).padding(.top, 20).padding(.trailing, 100)
                    Text(formatter.string(from: self.history.startDate)).font(.caption).foregroundColor(Color.gray)
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
                        }

                    }
                }
                
            }
            HStack{
            Button(action: {
                print("Ubah State Ride Disini")
                //self.deleteEventInvitationsList(at:self.EventInvitationsList.firstIndex(where: { $0.id == index.id })!)
            }){
                if self.history.isReviewed{
                    Text("Reviewed").font(.system(size: 14)).fontWeight(.bold)
                        .frame(width: 101, height: 34, alignment: .center)
                        .background(Color.white).cornerRadius(10).lineSpacing(16)
                }
                else
                {
                    Text("Give Review").font(.system( size: 14)).fontWeight(.bold)
                        .frame(width: 101, height: 34, alignment: .center)
                    .background(Color.yellow).cornerRadius(10).lineSpacing(16)
                }
                
            }
            .buttonStyle(PlainButtonStyle())
            .shadow(radius: 2, x: 1, y: 2).padding()
            Button(action: {
                    print("Ubah State Ride Disini")
                    //self.deleteEventInvitationsList(at:self.EventInvitationsList.firstIndex(where: { $0.id == index.id })!)
                }){
                    Text("Ride Again").font(.system(size: 14)).fontWeight(.bold)
                        .frame(width: 101, height: 34, alignment: .center)
                    .background(Color.yellow).cornerRadius(10).lineSpacing(16)
//                    Text("Ride Again").font(.custom("SFProDisplay-Bold", size: 14)).fontWeight(.bold)
//                        .frame(width: 101, height: 34, alignment: .center)
//                    .background(Color.yellow).cornerRadius(10).lineSpacing(16)
                }
                .buttonStyle(PlainButtonStyle())
                .shadow(radius: 2, x: 1, y: 2).padding()
        }
        
        }
    }
}

struct HistoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryItemView(history: dummyHistory[1])
    }
}

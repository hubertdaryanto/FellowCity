//
//  MainEvent.swift
//  Aplikasi Motor
//
//  Created by Hubert Daryanto on 27/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI


struct MainEvent: View {
    @State var showProfileView = false
    var attendedEventList: [AttendEventList] = [AttendEventList(id: 1, name: "Shell Tebet -> Ancol", startDate: formatter.date(from: "04/08/2020 7:00")!)]
    var body: some View {
        NavigationView{
        VStack{
            Text("Events - \(attendedEventList.count)")
            List(attendedEventList){ index in
                HStack{
                VStack{
                    Text(index.name)
                    Text("\(formatter.string(from: index.startDate))")
                }
                    NavigationLink(destination:
                     Event_Information())
                    {
                        Image(systemName: "info.circle").foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0))

                    }
                }
            }
            Spacer()
            HStack{
                Spacer()
            NavigationLink(destination: Create_Event_Information())
            {
                Image(systemName: "plus.circle.fill").resizable().foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0)).frame(width: 50, height: 50, alignment: .center)
            }.padding(20)
            }
            }.navigationBarTitle("Available To Ride", displayMode: .inline).navigationBarBackButtonHidden(true)
            .navigationBarItems(trailing: Button(action : {
                self.showProfileView.toggle()
            }){
                Image(systemName: "person.crop.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.gray, lineWidth: 2))
            })
        }
    }
}

struct MainEvent_Previews: PreviewProvider {
    static var previews: some View {
        MainEvent()
    }
}

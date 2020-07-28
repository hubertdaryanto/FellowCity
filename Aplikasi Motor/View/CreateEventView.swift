//
//  CreateEventView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 28/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct CreateEventView: View {
    
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    @State private var eventDate = Date()
    @State var eventName: String = ""
    @State var eventMeetingPoint: String = ""
    @State var eventDestinastion: String = ""
    
    
    var body: some View {
        
        //        NavigationView{
        
        VStack(alignment: .leading){
//            Spacer()
            
            Text("Event Name")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.yellow)
            TextField("Your Event Name...", text: $eventName, onEditingChanged: { (changed) in
                print("Username onEditingChanged - \(changed)")
            }) {
                print("Username onCommit")
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Meeting Point")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.yellow)
            TextField("Your Meeting Point...", text: $eventMeetingPoint, onEditingChanged: { (changed) in
                print("Username onEditingChanged - \(changed)")
            }) {
                print("Username onCommit")
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            //                Spacer()
            
            Text("Destination")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.yellow)
            TextField("Your Destination...", text: $eventDestinastion, onEditingChanged: { (changed) in
                print("Username onEditingChanged - \(changed)")
            }) {
                print("Username onCommit")
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Schedule")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.yellow)
            
            //DatePicker("", selection: $eventDate,, in: ...Date() displayedComponents: [.date, .hourAndMinute]){
            DatePicker(selection: $eventDate, in: ...Date(), displayedComponents: [.date, .hourAndMinute]) {
                Text("")
            }
            
            //Text("Date is \(eventDate, formatter: dateFormatter)")
            
            //Text("Next")
            HStack{
                Spacer()
                NavigationLink(destination: CreateEventOptionalRouteView())
                {
                    Text("Next")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.yellow)
                }
            }
            .padding()
            
            //                Spacer()
            
        }
        .padding()
        
        
        
        
        
        
        //End of NavigationView
        //            .navigationBarTitle(Text("Create Event"), displayMode: .inline)
        //}
        
        
        
    }
}

struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView()
    }
}

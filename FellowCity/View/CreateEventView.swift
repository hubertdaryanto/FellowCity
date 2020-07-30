////
////  CreateEventView.swift
////  Aplikasi Motor
////
////  Created by Feri Fajri on 28/07/20.
////  Copyright © 2020 Hubert Daryanto. All rights reserved.
////
//
//import SwiftUI
//
//struct CreateEventView: View {
//
//
//    var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .long
//        return formatter
//    }
//
//    @State private var eventDate = Date()
//    @State var eventName: String = ""
//    @State var eventMeetingPoint: String = ""
//    @State var eventDestinastion: String = ""
//
//
//    var body: some View {
//
//        //        NavigationView{
//
//        VStack(alignment: .leading){
////            Spacer()
//
//            Text("Event Name")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .foregroundColor(Color.yellow)
//            TextField("Your Event Name...", text: $eventName, onEditingChanged: { (changed) in
//                print("Username onEditingChanged - \(changed)")
//            }) {
//                print("Username onCommit")
//            }
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//
//            Text("Meeting Point")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .foregroundColor(Color.yellow)
//            TextField("Your Meeting Point...", text: $eventMeetingPoint, onEditingChanged: { (changed) in
//                print("Username onEditingChanged - \(changed)")
//            }) {
//                print("Username onCommit")
//            }
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//
//            //                Spacer()
//
//            Text("Destination")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .foregroundColor(Color.yellow)
//            TextField("Your Destination...", text: $eventDestinastion, onEditingChanged: { (changed) in
//                print("Username onEditingChanged - \(changed)")
//            }) {
//                print("Username onCommit")
//            }
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//
//            Text("Schedule")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .foregroundColor(Color.yellow)
//
//            //DatePicker("", selection: $eventDate,, in: ...Date() displayedComponents: [.date, .hourAndMinute]){
//            DatePicker(selection: $eventDate, in: ...Date(), displayedComponents: [.date, .hourAndMinute]) {
//                Text("")
//            }
//
//            //Text("Date is \(eventDate, formatter: dateFormatter)")
//
//            //Text("Next")
//            HStack{
//                Spacer()
//                NavigationLink(destination: CreateEventOptionalRouteView())
//                {
//                    Text("Next")
//                        .font(.body)
//                        .fontWeight(.bold)
//                        .foregroundColor(Color.yellow)
//                }
//            }
//            .padding()
//
//            //                Spacer()
//
//        }
//        .padding()
//
//
//
//
//
//
//        //End of NavigationView
//        //            .navigationBarTitle(Text("Create Event"), displayMode: .inline)
//        //}
//
//
//
//    }
//}
//
//struct CreateEventView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateEventView()
//    }
//}


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
    
    @State var eventDate = Date()
    @State var eventName: String = ""
    @State var eventMeetingPoint: String = ""
    @State var eventDestinastion: String = ""
//    @State var message: String = ""
    
    var body: some View {
        
        //        NavigationView{
        
        VStack(alignment: .leading){
            Spacer()
            VStack(alignment: .leading){
            Text("Event Name")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
            TextField("Your Event Name...", text: $eventName, onEditingChanged: { (changed) in
                print("Username onEditingChanged - \(changed)")
            }) {
                print("Username onCommit")
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Spacer()
            VStack(alignment: .leading){
            Text("Meeting Point")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
            TextField("Your Meeting Point...", text: $eventMeetingPoint, onEditingChanged: { (changed) in
                print("Username onEditingChanged - \(changed)")
            }) {
                print("Username onCommit")
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Spacer()
           VStack(alignment: .leading){
            Text("Destination")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
            TextField("Your Destination...", text: $eventDestinastion, onEditingChanged: { (changed) in
                print("Username onEditingChanged - \(changed)")
            }) {
                print("Username onCommit")
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
            Spacer()
            VStack(alignment: .leading){
            Text("Schedule")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
                .padding(.bottom)
            //DatePicker("", selection: $eventDate,, in: ...Date() displayedComponents: [.date, .hourAndMinute]){
            DatePicker(selection: $eventDate, in: ...Date(), displayedComponents: [.date, .hourAndMinute]) {
                Text("")
            }.frame(height: 120, alignment: .center)
            }
            
            //Text("Date is \(eventDate, formatter: dateFormatter)")
            Spacer()
            VStack(alignment: .leading){
//            HStack{
//                Spacer()
//                NavigationLink(destination: CreateEventOptionalRouteView())
//                {
//                    Text("Next")
//                        .font(.body)
//                        .fontWeight(.bold)
//                        .foregroundColor(Color.yellow)
//                }.padding()
//            }
                
                HStack{
                    Spacer()
//                        NavigationLink(destination: CreateEventOptionalRouteView())
                    NavigationLink(destination: CreateEventOptionalRouteView(eventDate: eventDate, eventName: eventName, eventMeetingPoint: eventMeetingPoint, eventDestinastion: eventDestinastion))
                {
                    Text("Next")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
                }
                }.padding()
            
            }
            
            
            

//            Spacer()
            
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

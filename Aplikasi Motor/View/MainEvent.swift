//
//  MainEvent.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 27/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI



struct MainEvent: View {
    
    @State var showProfileView = false
    var attendedEventList: [AttendEventList] = [AttendEventList(id: 1, name: "Shell Tebet -> Ancol", date: "04/08/2020", time: "7:00")]
    
    private let statusRider = ["Busy", "Available"]
    @State private var selectedStatus = 0
    
    var body: some View {
        
        NavigationView{

            
            ZStack {
            
            List{
                Section(header: Text("Events - \(self.attendedEventList.count)")) {
                    ForEach(self.attendedEventList) { index in
                ZStack{
                    NavigationLink(destination:
                        ExploreView(explore: exploreData[0])
                    ){
                    EmptyView()
                    }.hidden()
                
                    HStack{
                    VStack(alignment: .leading){
                        Text(index.name)
                        HStack{
                            Text(index.date)
                            Text("-")
                            Text(index.time)
                        }
                    }
                    Spacer()
                    
                    Image(systemName: "info.circle").foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0))
                }
                    }
                
                }}
            }
            // End of List Event
                VStack(){
                    Spacer()
                    HStack {
                    Spacer()
                        
                        ZStack {
                            NavigationLink(destination: CreateEventView())
                            {
                                Image(systemName: "plus.circle.fill").resizable().foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0)).frame(width: 50, height: 50, alignment: .center)
                                .shadow(radius: 2, x: 1, y: 2)
                            }

                        }
                    }.padding(30)
    
                }
                
//                VStack {
//                    //Spacer()
//                    Text("Hello").offset(x: 0, y: -10)
//                    Spacer()
//                } //.edgesIgnoringSafeArea(.all)
                
                
            }
                
                
            //End of NavigationView
    
               
        .navigationBarTitle(
            
            Text("")
            
            
           
            
            , displayMode: .inline)
            

                
            .navigationBarItems(
                leading:
                HStack() {
                    Spacer()
//
                    VStack(alignment: .leading) {
                    StatusRiderView()
                        .frame(height: 50, alignment: .leading)
                    }.offset(x: 50, y: 0)

                }
                , trailing:
            
                        Button(action: {
                            self.showProfileView.toggle()
                        }) {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .background(Color.white)
                                .overlay(RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.gray, lineWidth: 2))
                        }
                )
                        .sheet(isPresented: $showProfileView) {
                            TabEventsView()
                    }
        }
    }
    
}
    


struct MainEvent_Previews: PreviewProvider {
    static var previews: some View {
        MainEvent()
    }
}



//
//  CreateEventOptionalRouteView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 28/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct CreateEventOptionalRouteView: View {

    //@State var explores:[Explore]
    @State private var optionalRoute: [Item] = (0..<exploreData.count).map { Item(title: "Location #\($0)") }
//
//    @State private var exp

//    @State var eventName: String = ""
    @State var eventDate = Date()
    @State var eventName: String = ""
    @State var eventMeetingPoint: String = ""
    @State var eventDestinastion: String = ""

    @State var selectedRoute: [SelectedRoute] = []

    @State var sselectedRoute:[String] = []


     var body: some View {

//            NavigationView{


                VStack(alignment: .leading){
                    Spacer()
                    Text("Select Your Optional Route")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
                    .padding()

                    List {


//                        ForEach(exploreData) { item in
//                            Text(item.name)
//                        }


//                        ForEach(exploreData, id: \.self) { item in
//                            MultipleSelectionRow(title: item.name, isSelected: self.selectedRoute.contains(SelectedRoute(name: item.name))) {
//                                if self.selectedRoute.contains(SelectedRoute(name: item.name)) {
//                                    self.selectedRoute.removeAll(where: { $0 == SelectedRoute(name: item.name) })
//                                }
//                                else {
//                                    self.selectedRoute.append(SelectedRoute(name: item.name))
//                                    //                                    print(self.selectedRoute)
//                                }
//                            }
//                        }


                        ForEach(exploreData, id: \.self) { item in
                            MultipleSelectionRow(title: item.name, isSelected: self.sselectedRoute.contains(item.name)) {
                                if self.sselectedRoute.contains(item.name) {
                                    self.sselectedRoute.removeAll(where: { $0 == item.name })
                                }
                                else {
                                    self.sselectedRoute.append(item.name)
                                    //                                    print(self.selectedRoute)
                                }
                            }
                        }

                        // 1.
                        .onDelete(perform: onDelete)
                        .onMove(perform: onMove)
                    }



                    HStack{
                                      Spacer()
                        NavigationLink(destination:
//                            Event_Information()
                            Event_Information(eventDate: eventDate, eventName: eventName, eventMeetingPoint: eventMeetingPoint, eventDestinastion: eventDestinastion, sselectedRoute: sselectedRoute)

//                            @State var eventDate = Date()
//                            @State var eventName: String = ""
//                            @State var eventMeetingPoint: String = ""
//                            @State var eventDestinastion: String = ""


                            )
                                  {
                                      Text("Next")
                                      .font(.body)
                                      .fontWeight(.bold)
                                      .foregroundColor(Color(hex: 0xF7B500, alpha: 1))
                                  }
                                  }.padding()
                    Spacer()
                }






//                        End of NavigationView
//                .navigationBarTitle(Text("Create Event"), displayMode: .inline)
//                .navigationBarItems(trailing: EditButton())
//                    }

}


    private func onDelete(offsets: IndexSet) {
        optionalRoute.remove(atOffsets: offsets)
    }


    private func onMove(source: IndexSet, destination: Int) {
        optionalRoute.move(fromOffsets: source, toOffset: destination)
    }


}

struct CreateEventOptionalRouteView_Previews: PreviewProvider {
    static var previews: some View {
//        CreateEventOptionalRouteView(explores: exploreData)
        CreateEventOptionalRouteView()
    }
}

struct Item: Identifiable {
    let id = UUID()
    let title: String
}

struct SelectedRoute: Identifiable, Equatable {
  var id = UUID()
  var name: String
}


struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    var order: Int = 0

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {

                    Spacer()
                    Image(systemName: "checkmark").foregroundColor(Color(hex: 0xF7B500, alpha: 1))
//                    Text(String(order))
                }
            }
        }
    }
}


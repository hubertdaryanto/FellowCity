

//
//  MainEvent.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 27/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//
import SwiftUI
import CoreLocation

struct MainEvent: View {
    
//    @EnvironmentObject var popToHome:PopToHome
    @State var popToHome : Bool = false
    
    ///
    

    @State private var isShowingDetailView = false

    @State var showProfileView = false
//    var attendedEventList: [AttendEventList] = [AttendEventList(id: 1, name: "Pertamina Jatiasih -> Lot 9 Bintaro", date: "04/08/2020", time: "7:00")]
    
    var attendedEventList: [AttendEventList] = [AttendEventList(id: 1, name: "Pertamina Jatiasih -> Lot 9 Bintaro", date: "04/08/2020", time: "7:00")]


    @State var eventDate = Date()
    @State var eventName: String = "Pertamina Jatiasih -> Lot 9 Bintaro"
    @State var eventMeetingPoint: String = "Pertamina Jatiasih"
    @State var eventDestinastion: String = "Lot 9 Bintaro"
    @State var sselectedRoute: [String] = ["Pertamina Jatiasih", "Moto Village", "Lot 9 Bintaro"]
    @State var MeetingPoint: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: -6.3298786, longitude: 106.9439469)
       @State var LocationToBeVisited: [CLLocation] = [CLLocation(latitude: -6.3298786, longitude: 106.9439469), CLLocation(latitude: -6.258080, longitude: 106.808391), CLLocation(latitude: -6.2808073, longitude: 106.7122415)]
       @State var LocationToBeVisitedName: [String] = ["Pertamina Jatiasih", "Moto Village", "Lot 9 Bintaro"]


    private let statusRider = ["Busy", "Available"]
    @State private var selectedStatus = 0

    var body: some View {

        NavigationView{


            ZStack {

            List{


                    Section(header: HStack {
                        Text("MY EVENTS - \(self.attendedEventList.count)")
                            .font(.footnote)
                            .foregroundColor(Color(hex: 0x3c3c43, alpha: 0.6))
                            .padding()
//                            .clipped()
                            Spacer()
                    }
                    .background(Color(hex: 0xF2F2F7, alpha: 1))
                    .listRowInsets(EdgeInsets(
                        top: 0,
                        leading: 0,
                        bottom: 0,
                        trailing: 0))
                    )
                {
                    ForEach(self.attendedEventList) { index in
                ZStack{
                    NavigationLink(destination:
//                        ExploreView(explore: exploreData[0])
//                        TabFriendsView()
                        ListEventDetailsView(eventDate: self.eventDate, eventName: self.eventName, eventMeetingPoint: self.eventMeetingPoint, eventDestinastion: self.eventDestinastion, sselectedRoute: self.sselectedRoute,
                            MeetingPoint: self.MeetingPoint, LocationToBeVisited: self.LocationToBeVisited, LocationToBeVisitedName: self.LocationToBeVisitedName)

                    ){
                    EmptyView()
                    }.hidden()

                    HStack{
                    VStack(alignment: .leading){
                        Text(index.name).font(.body)
                        HStack{
                            Text(index.date).font(.subheadline)
                            .foregroundColor(.gray)
                            Text("-").font(.subheadline)
                            .foregroundColor(.gray)
                            Text(index.time).font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    Spacer()

                    Image(systemName: "info.circle").resizable()
                        .foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0))
                        .frame(width: 25, height: 25, alignment: .center)
                }
                    }

                }}
//                    .background(Color.blue)


            }
//            .listStyle(GroupedListStyle())
            // End of List Event
                VStack(){
                    Spacer()
                    HStack {
                    Spacer()

                        ZStack {




//                            NavigationLink(destination: CreateEventView(),isActive: self.$popToHome.homeIsActive)
//                           {
                            NavigationLink(
                            destination: CreateEventView(popToHome: self.$popToHome),
                            isActive: self.$popToHome
                            ){
                            
                                Image(systemName: "plus.circle.fill").resizable().foregroundColor(Color(hex: 0xF7B500, alpha: 1)).frame(width: 58, height: 58, alignment: .center)
                                .shadow(radius: 1, x: 1, y: 1)

                            }.isDetailLink(false)

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
//                    Spacer()
//
                    VStack(alignment: .leading) {
                        HStack{
                            StatusRiderView()
                    Image(systemName: "chevron.down")
                        }
                        .frame(height: 50, alignment: .leading)
                    }
//                    .offset(x: 50, y: 0)
                }
                , trailing:

                        Button(action: {
                            self.showProfileView.toggle()
                        }) {
                            Image("rossi")
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 36, height: 36)
                                .clipShape(Circle())
//                                .background(Color.white)
                                .overlay(RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.gray, lineWidth: 2))
                        }
                )
                        .sheet(isPresented: $showProfileView) {
                            ProfileView()
                    }
        }
    .statusBar(hidden: true)
    }

}



struct MainEvent_Previews: PreviewProvider {
    static var previews: some View {
        MainEvent()
    }
}


extension View {
/// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<SomeView: View>(to view: SomeView, when binding: Binding<Bool>) -> some View {
        modifier(NavigateModifier(destination: view, binding: binding))
    }
}


// MARK: - NavigateModifier
fileprivate struct NavigateModifier<SomeView: View>: ViewModifier {

    // MARK: Private properties
    fileprivate let destination: SomeView
    @Binding fileprivate var binding: Bool


    // MARK: - View body
    fileprivate func body(content: Content) -> some View {
        NavigationView {
            ZStack {
                content
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                NavigationLink(destination: destination
                    .navigationBarTitle("")
                    .navigationBarHidden(true),
                               isActive: $binding) {
                    EmptyView()
                }
            }
        }
    }
}

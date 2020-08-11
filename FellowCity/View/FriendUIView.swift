
import SwiftUI

struct FriendUIView: View {
    
    @State var showProfileView = false
    @State var isPresented: Bool = false
    @State var userID: String
    
    // List All User
    @State var allRideUser:[User]
    
    //User Setting
    @ObservedObject var userSettings = UserSettings()
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: FriendLists.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \FriendLists.name, ascending: true)]) var myFriends: FetchedResults<FriendLists>
    
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    Section(header: HStack {
                        Text("MY FRIENDS - \(myFriends.count)")
                            .font(.footnote)
                            .foregroundColor(Color("foregroundGrey").opacity(1))
                            .padding()
                        Spacer()
                    }
                    .background(Color("backgroundGrey").opacity(1))
                    .listRowInsets(EdgeInsets(
                        top: 0,
                        leading: 0,
                        bottom: 0,
                        trailing: 0))
                        )
                    {
                        ForEach(myFriends, id: \.self) { (index: FriendLists) in
                            //End of embed Nav Link
                            ZStack{
                            
                            
                            
                            NavigationLink(destination:
                                // Go to FriendProfileView
                                FriendProfileView(name: index.name ?? "", allRideUser: allUsers)
                                //
                                
                            ){
                                EmptyView()
                            }.hidden()
                                
                            HStack{
                                Image(allUsers[self.checkIndexofUser(name: index.name ?? "")].imageName)
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 36, height: 36)
                                    .clipShape(Circle())
                                    //                                .background(Color.white)
                                    .overlay(RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color("baseColor"), lineWidth: 2))
                                    
                                
                                VStack(alignment: .leading){
                                Text("\(index.name ?? "")")
                                    if allUsers[self.checkIndexofUser(name: index.name ?? "")].isAvailableToRide == true {
                                        Text("Available To Ride").foregroundColor(.gray)
                                            .fontWeight(.light)
                                            .font(.caption)
                                    } else {
                                        Text("Busy").foregroundColor(.gray)
                                        .fontWeight(.light)
                                        .font(.caption)
                                    }
                                }
                                Spacer()
                                Image(systemName: "chevron.right").foregroundColor(Color("baseColor").opacity(1))
                            }
                            }
                            //End of embed Nav Link
                        }.onDelete(perform: removeFriends)
                    }
                }
                .onAppear { UITableView.appearance().separatorStyle = .none }
                //.onDisappear { UITableView.appearance().separatorStyle = .singleLine }
                VStack(){
                    Spacer()
                    HStack{
                        Spacer()
                        ZStack {
                            
                            Button(action: {
                                self.isPresented = true
                            })
                            {
                                Image(systemName: "plus.circle.fill").resizable().foregroundColor(Color("baseColor").opacity(1)).frame(width: 58, height: 58, alignment: .center)
                                    .shadow(radius: 1, x: 1, y: 1)
                            }
                        }}.padding(30)
                }
                    
                .navigationBarTitle(
                    Text("Friends"), displayMode: .inline)
                    .navigationBarItems(
//                        leading:
//                        HStack() {
//                            VStack(alignment: .leading) {
//                                HStack{
//                                    StatusRiderView()
//                                    Image(systemName: "chevron.down")
//                                }
//                                .frame(height: 50, alignment: .leading)
//                            }
//                        }
//                        ,
                        trailing:
                        HStack{
                            EditButton()
                            Button(action: {
                                self.showProfileView.toggle()
                            }) {
                                Image("\(userSettings.imageName)")
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 36, height: 36)
                                    .clipShape(Circle())
                                    //                                .background(Color.white)
                                    .overlay(RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color.gray, lineWidth: 2))
                            }
                        }
                )
                    .sheet(isPresented: $showProfileView) {
                        ProfileView(rideLevel: rideLevels)
                }
                VStack{
                    AddFriendsAlertView(isShown: $isPresented, onAdd: { text in
                    }, userID: $userID, allRideUser: allUsers)
                }
            }
        }
    }
    
    func checkIndexofUser(name : String) -> Int {
    //           let index = allRideUser.index { $0 == "\(name)" } ?? 0
            guard let index = allRideUser.firstIndex(where: { $0.name == "\(name)" })
                else { //
                return 0
            }
            return index
           }
    
    func removeFriends(at offsets: IndexSet) {
        for index in offsets {
            let friend = myFriends[index]
            managedObjectContext.delete(friend)
            do {
                try managedObjectContext.save()
            } catch {
                // handle the Core Data error
            }
        }
    }
    
    
}

struct FriendUIView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return FriendUIView( userID: "", allRideUser: allUsers).environment(\.managedObjectContext, context)
    }
}


extension LocalizedStringKey.StringInterpolation {
    mutating func appendInterpolation(_ value: Bool) {
        appendInterpolation(String(value))
    }
}

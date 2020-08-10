
import SwiftUI

struct FriendUIView: View {
    
    @State var showProfileView = false
    @State var isPresented: Bool = false
    @State var userID: String
    
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
                            HStack{
                                Text("\(index.name ?? "")")
                                Spacer()
                                Image(systemName: "info.circle").foregroundColor(Color("baseColor").opacity(1))
                            }
                        }.onDelete(perform: removeFriends)
                    }
                }
                .onAppear { UITableView.appearance().separatorStyle = .none }
                .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
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
                        leading:
                        HStack() {
                            VStack(alignment: .leading) {
                                HStack{
                                    StatusRiderView()
                                    Image(systemName: "chevron.down")
                                }
                                .frame(height: 50, alignment: .leading)
                            }
                        }
                        ,
                        trailing:
                        HStack{
                            EditButton()
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
                        }
                )
                    .sheet(isPresented: $showProfileView) {
                        ProfileView(rideLevel: rideLevels)
                }
                VStack{
                    AddFriendsAlertView(isShown: $isPresented, onAdd: { text in
                    }, userID: $userID, allRideUser: allRideUsers)
                }
            }
        }
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
        return FriendUIView( userID: "").environment(\.managedObjectContext, context)
    }
}

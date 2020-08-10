
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
                            .foregroundColor(Color(hex: 0x3c3c43, alpha: 0.6))
                            .padding()
                        Spacer()
                    }
                    .background(Color(hex: 0xf2f2f7, alpha: 1))
                    .listRowInsets(EdgeInsets(
                        top: 4,
                        leading: 0,
                        bottom: 4,
                        trailing: 0))
                        )
                    {
                        ForEach(myFriends, id: \.self) { (index: FriendLists) in
                            HStack{
                                Image(systemName: "person.fill")
                                    .font(.system(size: 35, weight: .thin))
                                    .frame(width: 50,height: 50)
                                    .background(Color.yellow)
                                    .clipShape(Circle())


                                
                                VStack(alignment: .leading,spacing: 3){
                                    Text("\(index.name ?? "")")
                                        .font(.headline)
                                    Text("Available to Ride")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)

                                }
                              
                                Spacer()
                                Image(systemName: "info.circle").foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0))
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
                                Image(systemName: "plus.circle.fill").resizable().foregroundColor(Color(hex: 0xF7B500, alpha: 1)).frame(width: 58, height: 58, alignment: .center)
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

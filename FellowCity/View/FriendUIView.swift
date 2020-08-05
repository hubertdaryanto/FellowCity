
import SwiftUI

//struct AlertWrapper<Content: View>: UIViewControllerRepresentable{
//    @Binding var isPresented: Bool
//    let alert: TextAlert
//    let content: Content
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<AlertWrapper>) -> UIHostingController<Content> {
//        UIHostingController(rootView: content)
//    }
//
//    final class Coordinator {
//        var alertController: UIAlertController?
//        init(_ controller: UIAlertController? = nil) {
//            self.alertController = controller
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator()
//    }
//    func updateUIViewController(_ uiViewController: UIHostingController<Content>, context: UIViewControllerRepresentableContext<AlertWrapper>) {
//        uiViewController.rootView = content
//        if isPresented && uiViewController.presentedViewController == nil {
//            var alert = self.alert
//            alert.action = {
//                self.isPresented = false
//                self.alert.action($0)
//            }
//            context.coordinator.alertController = UIAlertController(alert: alert)
//            uiViewController.present(context.coordinator.alertController!, animated: true)
//        }
//        if !isPresented && uiViewController.presentedViewController == context.coordinator.alertController {
//            uiViewController.dismiss(animated: true)
//        }
//    }
//}


struct FriendUIView: View {
    //    @State private var isAlert = false
    @State var showProfileView = false
    //    @State var showAddFriendAlert = false
    //    @State var friendID = ""
    //
    //
    //    @State private var isShowingAlert = false
    //    @State private var alertInput = ""
    @State var isPresented: Bool = false
    @State var userID: String
    
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    Section(header: HStack {
                        Text("MY FRIENDS - \(friendList.count)")
                            .font(.footnote)
                            .foregroundColor(Color(hex: 0x3c3c43, alpha: 0.6))
                            .padding()
                        //                            .clipped()
                        Spacer()
                    }
                    .background(Color(hex: 0xf2f2f7, alpha: 1))
                    .listRowInsets(EdgeInsets(
                        top: 0,
                        leading: 0,
                        bottom: 0,
                        trailing: 0))
                        )
                    {
//                        List(friendList){ index in
                            ForEach(friendList) { index in
                            HStack{
                                Text(index.name)
                                Spacer()
                                Image(systemName: "info.circle").foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0))
                            }
                        }
                        
                        
                        
                    }
                }
                    
                VStack(){
                    Spacer()
                    HStack{
                        Spacer()

                        ZStack {
//                        Spacer()
                        
                        Button(action:
                            {
                                //                            self.showAddFriendAlert = true
                                self.isPresented = true
                        }
                            )
                        {
                            Image(systemName: "plus.circle.fill").resizable().foregroundColor(Color(hex: 0xF7B500, alpha: 1)).frame(width: 58, height: 58, alignment: .center)
                            .shadow(radius: 1, x: 1, y: 1)
                        }

                        
                        
                        
                        
                        
                        }}.padding(30)
                    
                    
                    
                    
                }
                .navigationBarTitle(
                    
                    Text("Friends")
                    
                    
                    
                    
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
                        ,
                        trailing:

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
                
                
                
                //        .alert(isPresented: $showAddFriendAlert,  TextAlert(title: "Add Friend", action: {
                //                   print("Callback \($0 ?? "<cancel>")")
                //               }))
                VStack{
//                    Text("daf")
                    AddFriendsAlertView(isShown: $isPresented, userID: $userID, onAdd: { text in
                        //Append userID to friendList array here
                        //friendList.append(FriendList(id: 10, name: "adadad"))
                    })
                }
                }
            
        }
    }
}

//public struct TextAlert {
//    public var title: String
//    public var placeholder: String = ""
//    public var accept: String = "Add"
//    public var cancel: String = "Cancel"
//    public var action: (String?) -> ()
//}
//
//extension UIAlertController {
//    convenience init(alert: TextAlert) {
//        self.init(title: alert.title, message: "Increase your riding buddies!", preferredStyle: .alert)
//        addTextField { $0.placeholder = alert.placeholder }
//        addAction(UIAlertAction(title: alert.cancel, style: .cancel) { _ in
//            alert.action(nil)
//        })
//        let textField = self.textFields?.first
//        addAction(UIAlertAction(title: alert.accept, style: .default) { _ in
//            alert.action(textField?.text)
//        })
//    }
//}
//
//extension View{
//    public func alert(isPresented: Binding<Bool>, _ alert: TextAlert) -> some View {
//        AlertWrapper(isPresented: isPresented, alert: alert, content: self)
//    }
//    
//}
//


struct FriendUIView_Previews: PreviewProvider {
    static var previews: some View {
        FriendUIView( userID: "")
    }
}


//"struct TextFieldAlert<Presenting>: View where Presenting: View {
//
//    @Binding var isShowing: Bool
//    @Binding var text: String
//    let presenting: () -> Presenting
//    let title: String
//
//    var body: some View {
//        VStack{
//        GeometryReader { (deviceSize: GeometryProxy) in
//            ZStack {
//                self.presenting() .blur(radius: self.isShowing ? 2 : 0) .disabled(self.isShowing)
//                VStack {
//                    Text(self.title)
//                    TextField(self.title, text: self.$text)
//                    Divider()
//                    HStack {
//                        Button(action: {
//                            withAnimation {
//                                self.isShowing.toggle()
//                            }
//                        }) {
//                            Text("Dismiss")
//                        }
//                    }
//                }
//                .padding()
//                .background(Color.white)
//                .frame(
//                    width: deviceSize.size.width*0.7,
//                    height: deviceSize.size.height*0.7
//                )
////                .shadow(radius: 1)
//                .opacity(self.isShowing ? 1 : 0)
//            }
//            }}
//    }
//
//}
//
//
//extension View {
//
//    func textFieldAlert(isShowing: Binding<Bool>,
//                        text: Binding<String>,
//                        title: String) -> some View {
//        TextFieldAlert(isShowing: isShowing, text: text, presenting: { self },
//                       title: title)
//    }
//
//}
//"

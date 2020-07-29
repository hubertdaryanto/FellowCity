//
//  FrriendUIView.swift
//  Aplikasi Motor
//
//  Created by Hubert Daryanto on 29/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct AlertWrapper<Content: View>: UIViewControllerRepresentable{
    @Binding var isPresented: Bool
    let alert: TextAlert
    let content: Content

    func makeUIViewController(context: UIViewControllerRepresentableContext<AlertWrapper>) -> UIHostingController<Content> {
        UIHostingController(rootView: content)
    }
    
    final class Coordinator {
        var alertController: UIAlertController?
        init(_ controller: UIAlertController? = nil) {
            self.alertController = controller
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    func updateUIViewController(_ uiViewController: UIHostingController<Content>, context: UIViewControllerRepresentableContext<AlertWrapper>) {
        uiViewController.rootView = content
        if isPresented && uiViewController.presentedViewController == nil {
            var alert = self.alert
            alert.action = {
                self.isPresented = false
                self.alert.action($0)
            }
            context.coordinator.alertController = UIAlertController(alert: alert)
            uiViewController.present(context.coordinator.alertController!, animated: true)
        }
        if !isPresented && uiViewController.presentedViewController == context.coordinator.alertController {
            uiViewController.dismiss(animated: true)
        }
    }
}


struct FriendUIView: View {
    @State var showProfileView = false
    @State var showAddFriendAlert = false
    var body: some View {
        NavigationView{
        VStack(alignment: .leading){
            
            Section(header: Text("FRIENDS - \(friendList.count)").padding(.leading, 20).font(.custom("SF-Pro-Text-Regular", size: 17)).foregroundColor(Color(UIColor(red: 0.78, green: 0.78, blue: 0.8, alpha: 1))))
            {
                List(friendList){ index in
                    HStack{
                    Text(index.name)
                    Spacer()
                    Image(systemName: "info.circle").foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0))
                    }
                }
                
            }
            HStack{
                Spacer()
                
                Button(action:
                    {
                        self.showAddFriendAlert = true
                }
                )
                {
                Image(systemName: "plus.circle.fill").resizable().foregroundColor(Color(red: 0.96484375, green: 0.7421875, blue: 0)).frame(width: 50, height: 50, alignment: .center)
                    .shadow(radius: 2, x: 1, y: 2).padding(20)
                }
            }
            
            
        }
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
                                    ProfileView()
                            }
        .alert(isPresented: $showAddFriendAlert,  TextAlert(title: "Add Friend", action: {
                   print("Callback \($0 ?? "<cancel>")")
               }))
    }
    }
}

public struct TextAlert {
    public var title: String
    public var placeholder: String = ""
    public var accept: String = "Add"
    public var cancel: String = "Cancel"
    public var action: (String?) -> ()
}

extension UIAlertController {
    convenience init(alert: TextAlert) {
        self.init(title: alert.title, message: "Increase your riding buddies!", preferredStyle: .alert)
        addTextField { $0.placeholder = alert.placeholder }
        addAction(UIAlertAction(title: alert.cancel, style: .cancel) { _ in
            alert.action(nil)
        })
        let textField = self.textFields?.first
        addAction(UIAlertAction(title: alert.accept, style: .default) { _ in
            alert.action(textField?.text)
        })
    }
}

extension View{
    public func alert(isPresented: Binding<Bool>, _ alert: TextAlert) -> some View {
        AlertWrapper(isPresented: isPresented, alert: alert, content: self)
    }
    
}



struct FrriendUIView_Previews: PreviewProvider {
    static var previews: some View {
        FriendUIView()
    }
}

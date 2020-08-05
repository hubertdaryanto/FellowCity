//
//  StatusRiderView.swift
//  Aplikasi Motor
//
//  Created by Feri Fajri on 27/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import SwiftUI

struct StatusRiderView: View {
    
    @State private var colours = ["Busy","Available to Ride"]
    @State private var selection = 1
    @State private var pickerVisible = false
    
    var body: some View {
//        List{
        VStack {
            
            if pickerVisible {
                VStack(alignment: .leading) {
//                    Spacer()
                    Picker(selection: $selection, label: Text("") ) {
                        ForEach (0..<colours.count) {
//                            HStack {
                        Text(self.colours[$0]).foregroundColor(.secondary)
                                    .frame(height: 10, alignment: .leading)
                                
                            
                        }
                        
                        
                    }
                        
                        
                    
                    

                    .onTapGesture {
                        self.pickerVisible.toggle()
                    }

//                    Spacer()
                    
                }
            } else {
                VStack(alignment: .leading) {
                    Spacer()
                    Button(colours[selection]) {
                        if self.pickerVisible {
                            
                        }
                        self.pickerVisible.toggle()
                    }
                    .foregroundColor(self.pickerVisible ? .gray : .green)
                    
                    //Image(systemName: "person.crop.circle").foregroundColor(self.pickerVisible ? .gray : .green)
                    
                    Spacer()
                }
        }
            
            
            
        }
//        }
    }
}

struct StatusRiderView_Previews: PreviewProvider {
    static var previews: some View {
        StatusRiderView()
    }
}

//
//  SearchBar.swift
//  FellowCity
//
//  Created by Feri Fajri on 06/08/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import Foundation
import SwiftUI


struct SearchBarList: UIViewRepresentable {
    
    @Binding var textSearch: String
    var placeholder: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var textSearch: String
        
        init(text: Binding<String>) {
            _textSearch = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            textSearch = searchText
        }
        
    }
    
    func makeCoordinator() -> SearchBarList.Coordinator {
        return Coordinator(text: $textSearch)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBarList>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBarList>) {
        uiView.text = textSearch
    }
}

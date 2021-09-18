//
//  SearchScreanView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct SearchScreanView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                
            }
        }.navigationTitle("Top View")
    }
}

struct SearchScreanView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchScreanView().environment(\.colorScheme, .dark)
            SearchScreanView()
        }
    }
}

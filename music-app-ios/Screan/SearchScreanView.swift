//
//  SearchScreanView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct SearchScreanView: View {
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            ScrollView {
                
            }.overlay(
                ZStack {
                    VStack {
                        SearchBarView()
                        ScrollMenuView()
                        Spacer()
                    }
                }
            )
        }
    }
}

struct SearchScreanView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchScreanView().environment(\.colorScheme, .dark).background(Color.black)
            SearchScreanView()
        }
    }
}

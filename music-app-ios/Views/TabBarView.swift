//
//  TabBarView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
            TabView {
                HomeScreanView()
                    .tabItem {
                        VStack {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                }.tag(1)
                SearchScreanView()
                    .tabItem {
                        VStack {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                }.tag(2)
                BlogScreanView()
                    .tabItem {
                        VStack {
                            Image(systemName: "newspaper.fill")
                            Text("Blog")
                        }
                }.tag(3)
                LibraryScreanView()
                    .tabItem {
                        VStack {
                            Image(systemName: "music.note.list")
                            Text("Library")
                        }
                }.tag(4)
                SettingScreanView()
                    .tabItem {
                        VStack {
                            Image(systemName: "gearshape.fill")
                            Text("Setting")
                        }
                }.tag(5)
            }.accentColor(.red)
            .overlay(
                VStack {
                    Spacer()
                    AudioPlayStatusView()
                        .padding(.bottom, 48)
                }
            )
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView().environment(\.colorScheme, .dark)
            TabBarView().environment(\.locale, .init(identifier: "ja"))
        }
    }
}

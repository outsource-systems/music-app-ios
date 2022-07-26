//
//  TabBarView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
    
    var body: some View {
            TabView {
                HomeScreanView().padding(.bottom, 50)
                    .tabItem {
                        VStack {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                }.tag(1)
                SearchScreanView().padding(.bottom, 50)
                    .tabItem {
                        VStack {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                }.tag(2)
                BlogScreanView().padding(.bottom, 50)
                    .tabItem {
                        VStack {
                            Image(systemName: "newspaper.fill")
                            Text("Blog")
                        }
                }.tag(3)
                LibraryScreanView().padding(.bottom, 50)
                    .tabItem {
                        VStack {
                            Image(systemName: "music.note.list")
                            Text("Library")
                        }
                }.tag(4)
                SettingScreanView().padding(.bottom, 50)
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
                    AVPlayerStatusBarView()
                        .padding(.bottom, 48)
                }
            )
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView().environment(\.colorScheme, .dark).environmentObject(AudioPlayerViewModel())
            TabBarView().environment(\.locale, .init(identifier: "ja")).environmentObject(AudioPlayerViewModel())
        }
    }
}

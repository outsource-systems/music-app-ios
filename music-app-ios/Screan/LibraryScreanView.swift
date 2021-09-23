//
//  LibraryScreanView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct LibraryScreanView: View {
    let menus: [String] = ["Playlists","Artists","Albums","Songs","Genres","Composers"]
    var body: some View {
        NavigationView {
            List(menus, id: \.self) { menu in
                NavigationLink(destination: Text(menu)) {
                    Text(menu)
                }
            }
            .navigationTitle("Library")
        }.overlay(
            VStack {
                HStack {
                    Spacer()
                    TextButtonView(labelText: "Edit")
                }
                Spacer()
            }
        )
    }
}

struct LibraryScreanView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LibraryScreanView().environment(\.colorScheme, .dark)
            LibraryScreanView()
        }
    }
}

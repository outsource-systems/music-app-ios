//
//  LibraryScreanView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct LibraryScreanView: View {
    let libraryMenuViewModel: LibraryMenuViewModel = LibraryMenuViewModel()
    
    var body: some View {
        NavigationView {
            List(libraryMenuViewModel.libraryMenu, id: \.self) { item in
                NavigationLink(destination: Text(item.name)) {
                    HStack {
                        Image(systemName: item.icon).foregroundColor(Color("ButtonLabel")).frame(width: 30)
                        Text(item.name)
                            .font(.title3)
                        Spacer()
                    }
                }
            }
            .navigationTitle(LocalizedStringKey("Library"))
            .toolbar(content: {
                TextButtonView(labelText: "Edit", destination: AnyView(Text("Edit")))
            })
        }.accentColor(Color("ButtonLabel"))
    }
}

struct LibraryScreanView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LibraryScreanView().environment(\.colorScheme, .dark)
            LibraryScreanView().environment(\.locale, .init(identifier: "ja"))
        }
    }
}

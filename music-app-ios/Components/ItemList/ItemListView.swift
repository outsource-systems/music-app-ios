//
//  ItemListView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/26.
//

import SwiftUI

struct ItemListView: View {
    let headerTitle: String
    let rightLinkText: String
    let audios: [Audio]
    let rightLinkDestination: AnyView
    let itemWidth: CGFloat = 390
    let rows: [GridItem] = Array(repeating: .init(.fixed(50)), count: 5)
    var body: some View {
        VStack {
            ListHeader(headerTitle: headerTitle, rightLinkText: rightLinkText, rightLinkDestination: rightLinkDestination)
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, alignment: .top) {
                    ForEach(audios, id: \.self) { audio in
                        ItemHorizontalView(size: 50, productTitle: "album", relaseDate: "2020", title: audio.title, imageUrl: audio.posterFile).frame(width: itemWidth)
                    }
                }
            }
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        let headerTitle: String = "Top Songs"
        let rightLinkText: String = "See All"
        let topItemViewModel: TopItemViewModel = TopItemViewModel()
        
        ItemListView(headerTitle: headerTitle, rightLinkText: rightLinkText, audios: topItemViewModel.audioList.audios, rightLinkDestination: AnyView(Text(rightLinkText))).environment(\.colorScheme, .dark).background(Color(.black))
        ItemListView(headerTitle: headerTitle, rightLinkText: rightLinkText, audios: topItemViewModel.audioList.audios, rightLinkDestination: AnyView(Text(rightLinkText)))
    }
}

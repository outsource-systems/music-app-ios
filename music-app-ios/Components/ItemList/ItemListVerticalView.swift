//
//  ItemListVerticalView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/26.
//

import SwiftUI

struct ItemListVerticalView: View {
    let audios: [Audio]
    let itemWidth: CGFloat = 390
    var body: some View {
        ScrollView {
            ForEach(audios) {audio in
                ItemHorizontalView(size: 50, productTitle: "album", relaseDate: "2020", title: audio.title, imageUrl: audio.posterFile).frame(width: itemWidth).frame(width: itemWidth)
            }.padding(.vertical)
        }
    }
}

struct ItemListVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        let topItemViewModel: TopItemViewModel = TopItemViewModel()
        ItemListVerticalView(audios: topItemViewModel.audioList.audios)
    }
}

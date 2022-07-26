//
//  ItemListVerticalView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/26.
//

import SwiftUI

struct ItemListVerticalView: View {
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
    let audios: [Audio]
    let itemWidth: CGFloat = 390
    var body: some View {
        ScrollView {
            ForEach(Array(audios.enumerated()), id: \.offset) { index, audio in
                Button(action: {
                    audioPlayerViewModel.setCurrentAudio(currentAudioList: audios, currentAudioIndex: index)
                }) {
                ItemHorizontalView(audio: audio).frame(width: itemWidth).frame(width: itemWidth)
                }.accentColor(Color("Text"))
            }.padding(.vertical)
        }
    }
}

struct ItemListVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        let topItemViewModel: TopItemViewModel = TopItemViewModel()
        ItemListVerticalView(audios: topItemViewModel.items)
    }
}

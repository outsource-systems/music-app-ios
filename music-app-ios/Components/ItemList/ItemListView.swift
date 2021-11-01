//
//  ItemListView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/26.
//

import SwiftUI

struct ItemListView: View {
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
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
                    ForEach(Array(audios.enumerated()), id: \.offset) { index, audio in
                        Button(action: {
                            audioPlayerViewModel.setCurrentAudio(currentAudioList: audios, currentAudioIndex: index)
                        }) {
                            ItemHorizontalView(audio: audio).frame(width: itemWidth)
                            }.accentColor(Color("Text"))
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
        
        ItemListView(headerTitle: headerTitle, rightLinkText: rightLinkText, audios: topItemViewModel.audioList.audios, rightLinkDestination: AnyView(Text(rightLinkText))).environment(\.colorScheme, .dark).background(Color(.black)).environmentObject(AudioPlayerViewModel())
        ItemListView(headerTitle: headerTitle, rightLinkText: rightLinkText, audios: topItemViewModel.audioList.audios, rightLinkDestination: AnyView(Text(rightLinkText))).environmentObject(AudioPlayerViewModel())
    }
}

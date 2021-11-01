//
//  ProductItemListView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/25.
//

import SwiftUI

struct ProductItemListView: View {
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
    var items: [Audio]
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    Button(action: {
                        audioPlayerViewModel.setCurrentAudio(currentAudioList: items, currentAudioIndex: index)
                    }) {
                    ListItemView(audio: item)
                    }.accentColor(Color("Text"))
                }
            }
            .padding(.top, 30)
        }
    }
}

struct ProductItemListView_Previews: PreviewProvider {
    static var previews: some View {
        let productViewModel: ProductViewModel = ProductViewModel()
        ProductItemListView(items: productViewModel.product.audios ?? []).environment(\.colorScheme, .dark).environmentObject(AudioPlayerViewModel())
        ProductItemListView(items: productViewModel.product.audios ?? []).environmentObject(AudioPlayerViewModel())
    }
}

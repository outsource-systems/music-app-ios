//
//  AudioTitleItemsView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct AudioTitleItemsView: View {
    var audios: [Audio]
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                ForEach(audios, id: \.self) { audio in
                    AudioListItemView(title: audio.title, number: audio.diskNumber ?? 0)
                }
            }
            .padding(.top, 30)
        }
    }
}

struct AudioTitleItemsView_Previews: PreviewProvider {
    static var previews: some View {
        let albumViewModel: AlbumViewModel = AlbumViewModel()
        AudioTitleItemsView(audios: albumViewModel.album.audios).environment(\.colorScheme, .dark)
        AudioTitleItemsView(audios: albumViewModel.album.audios)
    }
}


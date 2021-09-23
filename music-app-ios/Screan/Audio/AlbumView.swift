//
//  AlbumView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct AlbumView: View {
    let album: Album
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: true) {
                    AlbumHeaderView()
                    AlbumCoverView(imageUrl: album.posterFile, title: album.productTitle, artists: album.productArtists, genre: album.genre, releaseDate: album.productReleaseDate)
                    PlayAndShuffleButtonView()
                    AudioTitleItemsView(audios: album.audios)
            }
        }
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        let albumViewModel: AlbumViewModel = AlbumViewModel()
        AlbumView(album: albumViewModel.album).environment(\.colorScheme, .dark)
        AlbumView(album: albumViewModel.album)
    }
}

